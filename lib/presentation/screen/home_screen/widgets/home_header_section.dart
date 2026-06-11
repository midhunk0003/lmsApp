import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/colors.dart';

class HomeHeaderSectionWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool showNotificationIcon;
  final bool showProfileImage;
  const HomeHeaderSectionWidget({
    super.key,
    required bool isTablet,
    this.title,
    this.subTitle,
    this.showNotificationIcon = false,
    this.showProfileImage = false,
  }) : _isTablet = isTablet;

  final bool _isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          showProfileImage
              ? Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.ghostwhite, width: 2.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/prodummyimg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : SizedBox(),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${title ?? 'Hello'}',
                  style: TextStyle(
                    color: AppColor.ghostwhite,
                    fontSize: _isTablet ? 30 : 24,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${subTitle ?? ''}',
                  style: TextStyle(
                    color: AppColor.lightgray,
                    fontSize: _isTablet ? 18 : 14,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // ── Widget ───────────────────────────────────────────────────────────
          showNotificationIcon
              ? Stack(
                clipBehavior: Clip.none,
                children: [
                  // ── Main glass circle
                  Container(
                    width: _isTablet ? 80 : 54,
                    height: _isTablet ? 80 : 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      // Dark glass gradient — center→topLeft (matches Figma)
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.secondaryGlassColor.withOpacity(
                            0.14,
                          ), // lighter top
                          AppColor.primaryGlassColor.withOpacity(
                            0.14,
                          ), // darker bottom
                        ],
                      ),

                      // Stroke: #37414E at 24% — exact Figma value
                      border: Border.all(
                        color: AppColor.gradientEnd.withOpacity(0.1),
                        width: 1.0,
                      ),
                      boxShadow: [
                        // Main soft shadow
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: const Offset(0.9, 0),
                        ),
                        // Bottom depth shadow
                        BoxShadow(
                          color: Colors.white.withOpacity(0.06),
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: const Offset(-0.6, 0),
                        ),

                        // Left subtle dark edge
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 6,
                          spreadRadius: -2,
                          offset: const Offset(-2, 0),
                        ),

                        // Top glossy highlight
                        BoxShadow(
                          color: Colors.white.withOpacity(0.10),
                          blurRadius: 6,
                          spreadRadius: -3,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),

                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/notification.svg',
                            // remove the ?? '' — asset path should never be null
                            width: _isTablet ? 32 : 22,
                            height: _isTablet ? 32 : 22,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ── Notification dot (top-right)
                  Positioned(
                    top: _isTablet ? 10.0 : 6.0,
                    right: _isTablet ? 10.0 : 6.0,
                    child: Container(
                      width: _isTablet ? 10 : 8,
                      height: _isTablet ? 10 : 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF38BDF8), // sky-400
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF0D1117), // match bg
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF38BDF8).withOpacity(0.65),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
