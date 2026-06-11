import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/colors.dart';
import 'package:lms/presentation/provider/search_course_provider.dart';
import 'package:lms/presentation/widgets/common_custom_app_bar_widget.dart';
import 'package:lms/presentation/widgets/common_custome_button_widget.dart';
import 'package:lms/presentation/widgets/common_text_form_widget_field.dart';
import 'package:lms/presentation/widgets/reusablebackground/reusablebackground.dart';
import 'package:lms/presentation/widgets/shimmer_widgets/category_grid_shimmer.dart';
import 'package:provider/provider.dart';

class SearchCourseScreen extends StatefulWidget {
  const SearchCourseScreen({Key? key}) : super(key: key);

  @override
  _SearchCourseScreenState createState() => _SearchCourseScreenState();
}

class _SearchCourseScreenState extends State<SearchCourseScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData();
  }

  void initialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SearchCourseProvider>(
        context,
        listen: false,
      );
      provider.fetchCourseCategory();
    });
  }

  final List<Color> categoryColors = [
    const Color(0xFF984D6A),
    const Color(0xFF4DA08E),
    const Color(0xFFD19A17),
    const Color(0xFF7C5A96),
    const Color(0xFF5A84A8),
    const Color(0xFF7D8C66),
    const Color(0xFFA45A46),
    const Color(0xFF924C65),
  ];

  @override
  Widget build(BuildContext context) {
    return Reusablebackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool _isTablet = constraints.maxWidth > 600;
          return Consumer<SearchCourseProvider>(
            builder: (context, searchCourseProvider, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: _isTablet ? 80 : 66),
                    CommonCustomAppBarWidget(
                      isTablet: _isTablet,
                      showBackButton: false,
                      title: "Search",
                      onBackButtonPressed: () {
                        Navigator.pop(context);
                      },
                      onShareButtonPressed: () {
                        print('share');
                      },
                      showShareButton: false,
                    ),
                    SizedBox(height: _isTablet ? 35 : 30),
                    CommonTextFormField(
                      isTablet: _isTablet,
                      hintText: "What do you want to learn?",
                      controller: searchController,
                      isSearch: true,
                      searchCourse: true,
                    ),
                    SizedBox(height: 40),
                    searchCourseProvider.showSearchScreen
                        ? SizedBox.shrink()
                        : Text(
                          'Browse by Category',
                          style: TextStyle(
                            color: AppColor.ghostwhite,
                            fontSize: _isTablet ? 22 : 20,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    SizedBox(
                      height: searchCourseProvider.showSearchScreen ? 0 : 24,
                    ),
                    searchCourseProvider.showSearchScreen
                        ? SubCategorySearchedWidget(isTablet: _isTablet)
                        : CategoryGridWidget(
                          isTablet: _isTablet,
                          categoryColors: categoryColors,
                          searchCourseProvider: searchCourseProvider,
                        ),
                    SizedBox(height: 120),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SubCategorySearchedWidget extends StatelessWidget {
  const SubCategorySearchedWidget({super.key, required bool isTablet})
    : _isTablet = isTablet;

  final bool _isTablet;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(color: Colors.transparent),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: AppColor.formBorderColor.withOpacity(0.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Text(
                          'Technology',
                          style: TextStyle(
                            color: AppColor.blueGrey,
                            fontSize: 12,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12);
                  },
                ),
              ),
              SizedBox(height: _isTablet ? 28 : 20),
              ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(_isTablet ? 16 : 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.formPrimaryColor.withOpacity(0.24),
                          AppColor.formSecondaryColor.withOpacity(0.24),
                        ],
                      ),
                      border: Border.all(
                        color: AppColor.formBorderColor.withOpacity(0.24),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 168,
                          height: 194,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300],
                            image: DecorationImage(
                              image: AssetImage('assets/images/toprated.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: _isTablet ? 18 : 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cognitive Psychology: An Introduction',
                                style: TextStyle(
                                  color: AppColor.ghostwhite,
                                  fontSize: _isTablet ? 20 : 16,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: _isTablet ? 13 : 10),
                              Text(
                                '₹2,999',
                                style: TextStyle(
                                  color: AppColor.ghostwhite,
                                  fontSize: _isTablet ? 22 : 18,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: _isTablet ? 10 : 8),
                              Text(
                                'A deep dive into the human mind.',
                                style: TextStyle(
                                  color: AppColor.lightgray,
                                  fontSize: _isTablet ? 18 : 14,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: _isTablet ? 16 : 12),
                              Row(
                                children: [
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      color: AppColor.lightgray,
                                      fontSize: _isTablet ? 18 : 14,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w400,
                                      height: 1.4,
                                    ),
                                  ),
                                  SizedBox(width: _isTablet ? 8 : 6),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        index < 4
                                            ? Icons.star
                                            : Icons.star_border,

                                        color: Colors.amber,
                                        size: _isTablet ? 20 : 16,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: _isTablet ? 22 : 16);
                },
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 18);
      },
    );
  }
}

class CategoryGridWidget extends StatelessWidget {
  final SearchCourseProvider searchCourseProvider;
  const CategoryGridWidget({
    super.key,
    required bool isTablet,
    required this.categoryColors,
    required this.searchCourseProvider,
  }) : _isTablet = isTablet;

  final bool _isTablet;

  final List<Color> categoryColors;

  @override
  Widget build(BuildContext context) {
    return (searchCourseProvider.isLoading ||
            searchCourseProvider.categoryList.isEmpty)
        ? CategoryGridShimmer(isTablet: _isTablet)
        : GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 1.3,
          ),
          itemCount: searchCourseProvider.categoryList.length,
          itemBuilder: (context, index) {
            final category = searchCourseProvider.categoryList[index];
            return Container(
              padding: EdgeInsets.all(_isTablet ? 18 : 16),
              decoration: BoxDecoration(
                color: categoryColors[index % categoryColors.length],
                borderRadius: BorderRadius.circular(_isTablet ? 22 : 20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        category.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _isTablet ? 24 : 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: _isTablet ? 6 : 4),

                      Text(
                        category.courseCount,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: _isTablet ? 16 : 12,
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      category.icon,
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
