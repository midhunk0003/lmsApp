import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:lms/core/dependence_injection.dart';
import 'package:lms/presentation/provider/auth_provider.dart';
import 'package:lms/presentation/provider/home_provider.dart';
import 'package:lms/presentation/provider/my_course_provider.dart';
import 'package:lms/presentation/provider/onboard_provider.dart';
import 'package:lms/presentation/provider/profile_provider.dart';
import 'package:lms/presentation/provider/search_course_provider.dart';
import 'package:lms/presentation/screen/auth_screen/login_screen.dart';
import 'package:lms/presentation/screen/auth_screen/register_screen.dart';
import 'package:lms/presentation/screen/home_screen/home_screen.dart';
import 'package:lms/presentation/screen/my_course_screen/course_detail_page.dart';
import 'package:lms/presentation/screen/my_course_screen/lecture_screen.dart';
import 'package:lms/presentation/screen/my_profile_screen/edit_profile_screen.dart';
import 'package:lms/presentation/screen/my_profile_screen/help_center_screen.dart';
import 'package:lms/presentation/screen/my_profile_screen/my_cart_screen.dart';
import 'package:lms/presentation/screen/onboard_screen/onboard_screen.dart';
import 'package:lms/presentation/screen/search_course_screen/search_course_screen.dart';
import 'package:lms/presentation/screen/splash_screen/splash_screen.dart';
import 'package:lms/presentation/widgets/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  runApp(
    DevicePreview(
      enabled: true, // 🔥 set false in production
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => MyCourseProvider()),
        ChangeNotifierProvider(create: (_) => SearchCourseProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IPO LMS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return _customPageRoute(SplashScreen());
            case '/onboardscreen':
              return _customPageRoute(OnboardScreen());
            case '/loginscreen':
              return _customPageRoute(LoginScreen());
            case '/registerscreen':
              return _customPageRoute(RegisterScreen());
            case '/homeScreen':
              return _customPageRoute(HomeScreen());
            case '/custombottomnavbarwidget':
              return _customPageRoute(CustomBottomNavbarWidget());
            case '/editprofilescreen':
              return _customPageRoute(EditProfileScreen());
            case '/mycartscreen':
              return _customPageRoute(MyCartScreen());
            case '/helpcenterscreen':
              return _customPageRoute(HelpCenterScreen());
            case '/searchcoursescreen':
              return _customPageRoute(SearchCourseScreen());
            case '/coursedetailpage':
              return _customPageRoute(CourseDetailPage(isPaid: true));
            case '/lecturescreen':
              return _customPageRoute(LectureScreen());
            default:
              return null;
          }
        },
      ),
    );
  }
}

PageRouteBuilder _customPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // No animation
    },
    transitionDuration: Duration.zero, // Instantly switch pages
  );
}
