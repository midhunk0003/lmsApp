import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/colors.dart';
import 'package:lms/presentation/screen/home_screen/home_screen.dart';
import 'package:lms/presentation/screen/my_course_screen/my_course_screen.dart';
import 'package:lms/presentation/screen/my_profile_screen/my_profile_screen.dart';
import 'package:lms/presentation/screen/search_course_screen/search_course_screen.dart';

class CustomBottomNavbarWidget extends StatefulWidget {
  const CustomBottomNavbarWidget({super.key});

  @override
  State<CustomBottomNavbarWidget> createState() =>
      _CustomBottomNavbarWidgetState();
}

class _CustomBottomNavbarWidgetState extends State<CustomBottomNavbarWidget> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    SearchCourseScreen(),
    MyCourseScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet = constraints.maxWidth >= 700;

        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,

          /// BODY
          body: pages[currentIndex],

          /// BOTTOM NAVBAR
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 120 : 68,
                // vertical: isTablet ? 16 : 68,
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(isTablet ? 50 : 40),

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),

                  child: Container(
                    height: isTablet ? 90 : 70,

                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 18 : 12,
                      vertical: isTablet ? 12 : 8,
                    ),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.formPrimaryColor.withOpacity(0.24),
                          AppColor.formSecondaryColor.withOpacity(0.24),
                        ],
                      ),

                      borderRadius: BorderRadius.circular(isTablet ? 50 : 40),

                      border: Border.all(
                        color: AppColor.formBorderColor.withOpacity(0.24),
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildItem(
                          selectedIcon: 'assets/svg/home.svg',
                          index: 0,
                          isTablet: isTablet,
                        ),
                        _buildItem(
                          selectedIcon: 'assets/svg/search.svg',
                          index: 1,
                          isTablet: isTablet,
                        ),
                        _buildItem(
                          selectedIcon: 'assets/svg/mycourse.svg',
                          index: 2,
                          isTablet: isTablet,
                        ),
                        _buildProfileItem(isTablet),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem({
    required String selectedIcon,
    required int index,
    required bool isTablet,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        width: isTablet ? 58 : 46,
        height: isTablet ? 58 : 46,

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient:
              isSelected
                  ? LinearGradient(colors: AppColor.primaryBlueGradient)
                  : null,

          color: isSelected ? null : Colors.white.withOpacity(0.04),

          border: Border.all(
            color: Colors.white.withOpacity(isSelected ? 0.0 : 0.08),
          ),
        ),

        child: Center(
          child: SvgPicture.asset(
            selectedIcon,
            width: isTablet ? 28 : 22,
            height: isTablet ? 28 : 22,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : AppColor.blueGrey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(bool isTablet) {
    final bool isSelected = currentIndex == 3;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = 3;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        width: isTablet ? 58 : 46,
        height: isTablet ? 58 : 46,

        padding: const EdgeInsets.all(3),

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient:
              isSelected
                  ? LinearGradient(colors: AppColor.primaryBlueGradient)
                  : null,
        ),

        child: CircleAvatar(
          backgroundImage: const AssetImage('assets/images/prodummyimg.jpg'),
        ),
      ),
    );
  }
}
