package com.example.lms


import android.net.Uri
import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.media3.common.MediaItem
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView

class VideoPlayerActivity : ComponentActivity() {

    private var player: ExoPlayer? = null
    private lateinit var playerView: PlayerView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        playerView = PlayerView(this)

        setContentView(playerView)

        val videoUrl = intent.getStringExtra("videoUrl")

        // CHECK URL
        if (videoUrl.isNullOrEmpty()) {

            Toast.makeText(
                this,
                "Video URL is empty",
                Toast.LENGTH_LONG
            ).show()

            finish()

            return
        }

        // CHECK VALID URL
        if (
            !videoUrl.startsWith("http://") &&
            !videoUrl.startsWith("https://")
        ) {

            Toast.makeText(
                this,
                "Invalid video URL",
                Toast.LENGTH_LONG
            ).show()

            finish()

            return
        }

        try {

            player = ExoPlayer.Builder(this).build()

            playerView.player = player

            val mediaItem =
                MediaItem.fromUri(Uri.parse(videoUrl))

            player?.setMediaItem(mediaItem)

            player?.prepare()

            player?.play()

        } catch (e: Exception) {

            Toast.makeText(
                this,
                "Unable to play video",
                Toast.LENGTH_LONG
            ).show()

            e.printStackTrace()

            finish()
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        player?.release()

        player = null
    }
}