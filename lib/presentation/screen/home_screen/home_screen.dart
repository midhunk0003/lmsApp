import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/colors.dart';
import 'package:lms/presentation/provider/home_provider.dart';
import 'package:lms/presentation/provider/my_course_provider.dart';
import 'package:lms/presentation/screen/home_screen/widgets/countinue_learning_widget.dart';
import 'package:lms/presentation/screen/home_screen/widgets/find_live_class.dart';
import 'package:lms/presentation/screen/home_screen/widgets/home_header_section.dart';
import 'package:lms/presentation/screen/home_screen/widgets/third_section_widget.dart';
import 'package:lms/presentation/screen/home_screen/widgets/top_rated_widget.dart';
import 'package:lms/presentation/widgets/reusablebackground/reusablebackground.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData();
  }

  void initialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = Provider.of<MyCourseProvider>(
        context,
        listen: false,
      );
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      profileProvider.getMyCoursesPro();
      homeProvider.getTopRatedCourses();
    });
  }

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
                HomeHeaderSectionWidget(
                  isTablet: _isTablet,
                  title: 'Hello Jeeva...',
                  subTitle: 'Ready to pick up where you left off?',
                  showNotificationIcon: true,
                  showProfileImage: false,
                ),
                SizedBox(height: 40),
                CountinueLearningWidget(isTablet: _isTablet),
                SizedBox(height: 30),
                ThirdSectionWidget(isTablet: _isTablet),
                SizedBox(height: 30),
                TopRatedWidget(isTablet: _isTablet),
                SizedBox(height: 30),
                FindLiveClassWidget(isTablet: _isTablet),
                SizedBox(height: kBottomNavigationBarHeight + 100),
              ],
            ),
          );
        },
      ),
    );
  }
}
