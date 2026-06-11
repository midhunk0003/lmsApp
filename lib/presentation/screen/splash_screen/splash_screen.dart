import 'package:flutter/material.dart';
import 'package:lms/core/colors.dart';
import 'package:lms/presentation/widgets/reusablebackground/reusablebackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// ✅ Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _navigateCheck();
  }

  void _navigateCheck() async {
    final pref = await SharedPreferences.getInstance();
    final isOnboardFinish = pref.getString('onboard') ?? null;
    print('is onboard finish: ${isOnboardFinish}');

    /// TOKEN CHECK
    final hasUserToken = await _hasToken();
    print('has user token: ${hasUserToken}');
    if (isOnboardFinish != null) {
      if (hasUserToken) {
        await Future.delayed(const Duration(seconds: 2));
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/custombottomnavbarwidget', // ✅ your route name
          (route) => false, // ✅ remove all previous routes
        );
        return;
      }
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/loginscreen', // ✅ your route name
        (route) => false, // ✅ remove all previous routes
      );
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/onboardscreen', // ✅ your route name
      (route) => false, // ✅ remove all previous routes
    );
  }

  Future<bool> _hasToken() async {
    final FlutterSecureStorage secureStorage;
    secureStorage = const FlutterSecureStorage();
    final token = await secureStorage.read(key: 'access_token');
    print('tokenaaaaaaaaaaaa: ${token}');
    return token != null && token.isNotEmpty;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Reusablebackground(
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LMS',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'AfacadFlux',
                  fontWeight: FontWeight.w400,
                  fontSize: 60,
                ),
              ),
              Text(
                'The journey to knowing',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'AfacadFlux',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
