import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/core/colors.dart';
import 'package:lms/presentation/screen/my_course_screen/recorded_class_tab_view/module_tab_screen.dart';
import 'package:lms/presentation/screen/my_course_screen/recorded_class_tab_view/resources_tab_view_screen.dart';
import 'package:lms/presentation/widgets/common_custom_app_bar_widget.dart';
import 'package:lms/presentation/widgets/reusablebackground/reusablebackground.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  static const platform = MethodChannel('lms.video.player');

  Future<void> openNativePlayer() async {
    try {
      await platform.invokeMethod('openVideoPlayer', {
        "videoUrl":
            "https://vz-72fbdbaa-55e.b-cdn.net/21a8ffab-c09d-4bbe-ac2e-10d4be0d39a9/playlist.m3u8",
        "title": "Flutter Course",
        "lastPosition": 0,
      });
    } on PlatformException catch (e) {
      debugPrint("Error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Reusablebackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isTablet = constraints.maxWidth > 600;

          return DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isTablet ? 80 : 66),

                        CommonCustomAppBarWidget(
                          isTablet: isTablet,
                          showBackButton: true,
                          title: "",
                          onBackButtonPressed: () {
                            Navigator.pop(context);
                          },
                          onShareButtonPressed: () {},
                          showShareButton: false,
                        ),

                        SizedBox(height: isTablet ? 35 : 30),

                        Text(
                          "Psychology of Relationships",
                          style: TextStyle(
                            color: AppColor.ghostwhite,
                            fontSize: isTablet ? 28 : 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: isTablet ? 28 : 24),

                        GestureDetector(
                          onTap: openNativePlayer,
                          child: Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 70,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: isTablet ? 28 : 24),

                        Text(
                          "1.2 Attachment Theory: Understanding Your Style",
                          style: TextStyle(
                            color: AppColor.ghostwhite,
                            fontSize: isTablet ? 22 : 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: isTablet ? 34 : 30),
                      ],
                    ),
                  ),

                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _TabBarDelegate(
                      TabBar(
                        dividerColor: AppColor.blueGrey,
                        labelColor: AppColor.ghostwhite,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.primaryBlueDark,
                              width: 3,
                            ),
                          ),
                        ),

                        tabs: const [
                          Tab(text: "Module"),
                          Tab(text: "Resources"),
                        ],
                      ),
                    ),
                  ),
                ];
              },

              body: const TabBarView(
                children: [ModuleTabScreen(), ResourcesTabViewScreen()],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.transparent, child: tabBar);
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
