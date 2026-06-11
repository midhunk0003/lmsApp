import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/colors.dart';
import 'package:lms/presentation/screen/home_screen/widgets/home_header_section.dart';
import 'package:lms/presentation/screen/my_profile_screen/widgets/logout_function_method.dart';
import 'package:lms/presentation/screen/my_profile_screen/widgets/myprofile_menu_list_widget.dart';
import 'package:lms/presentation/widgets/common_custom_app_bar_widget.dart';
import 'package:lms/presentation/widgets/reusablebackground/reusablebackground.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Reusablebackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool _isTablet = constraints.maxWidth > 600;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _isTablet ? 80 : 66),
                CommonCustomAppBarWidget(
                  isTablet: _isTablet,
                  showBackButton: false,
                  title: "My Profile",
                  onBackButtonPressed: () {
                    Navigator.pop(context);
                  },
                  onShareButtonPressed: () {
                    print('share');
                  },
                  showShareButton: false,
                ),
                SizedBox(height: _isTablet ? 35 : 30),
                HomeHeaderSectionWidget(
                  isTablet: _isTablet,
                  title: "Jeeva",
                  subTitle: "@jeeva27ks",
                  showNotificationIcon: false,
                  showProfileImage: true,
                ),
                SizedBox(height: _isTablet ? 45 : 40),
                Text(
                  'Account',
                  style: TextStyle(
                    color: AppColor.blueGrey,
                    fontSize: _isTablet ? 15 : 12,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: _isTablet ? 18 : 16),
                MyProfileMenuListWidget(
                  isTablet: _isTablet,
                  iconPath: 'assets/svg/profileicon.svg',
                  title: 'Edit Profile',
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    print('Edit Profile');
                    Navigator.pushNamed(context, '/editprofilescreen');
                  },
                ),
                SizedBox(height: _isTablet ? 18 : 16),
                MyProfileMenuListWidget(
                  isTablet: _isTablet,
                  iconPath: 'assets/svg/carticon.svg',
                  title: 'Cart',
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    print('Cart');
                    Navigator.pushNamed(context, '/mycartscreen');
                  },
                ),
                SizedBox(height: _isTablet ? 45 : 40),
                Text(
                  'General',
                  style: TextStyle(
                    color: AppColor.blueGrey,
                    fontSize: _isTablet ? 15 : 12,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: _isTablet ? 18 : 16),
                MyProfileMenuListWidget(
                  isTablet: _isTablet,
                  iconPath: 'assets/svg/notificationicon.svg',
                  title: 'Notifications',
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    print('Notifications');
                  },
                ),
                SizedBox(height: _isTablet ? 18 : 16),
                MyProfileMenuListWidget(
                  isTablet: _isTablet,
                  iconPath: 'assets/svg/helpcentericon.svg',
                  title: 'Help Center',
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    print('Help Center');
                    Navigator.pushNamed(context, '/helpcenterscreen');
                  },
                ),
                SizedBox(height: _isTablet ? 18 : 16),
                MyProfileMenuListWidget(
                  isTablet: _isTablet,
                  iconPath: 'assets/svg/contactusicon.svg',
                  title: 'Contact Us',
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    print('Contact Us');
                  },
                ),

                SizedBox(height: _isTablet ? 45 : 40),
                MyProfileMenuListWidget(
                  isTablet: _isTablet,
                  iconPath: 'assets/svg/logouticon.svg',
                  title: 'Log out',
                  trailingIcon: Icons.arrow_forward_ios,
                  logout: true,
                  onTap: () {
                    print('Log out');
                    logoutMethodFunction(context);
                  },
                ),
                SizedBox(height: _isTablet ? 110 : 150),
              ],
            ),
          );
        },
      ),
    );
  }
}
