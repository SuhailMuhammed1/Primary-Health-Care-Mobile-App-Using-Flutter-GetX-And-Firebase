import 'package:phc_lab/presentation/lab_report/add_lab_report.dart';
import 'package:phc_lab/presentation/lab_report/binding/add_lab_report_binding.dart';
import 'package:phc_lab/presentation/lab_report/binding/update_lab_report_binding.dart';
import 'package:phc_lab/presentation/lab_report/binding/view_lab_report_binding.dart';
import 'package:phc_lab/presentation/lab_report/update_lab_report.dart';
import 'package:phc_lab/presentation/lab_report/view_lab_report.dart';
import 'package:phc_lab/presentation/splash_screen/splash_screen.dart';
import 'package:phc_lab/presentation/splash_screen/binding/splash_binding.dart';
import 'package:phc_lab/presentation/login_screen/login_screen.dart';
import 'package:phc_lab/presentation/login_screen/binding/login_binding.dart';
import 'package:phc_lab/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:phc_lab/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:phc_lab/presentation/home_container_screen/home_container_screen.dart';
import 'package:phc_lab/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:phc_lab/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:phc_lab/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String profilePage = '/profile_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String addLabReport = '/add_lab_report';

  static const String viewLabReport = '/view_lab_report';

  static const String updateLabReport = '/update_lab_report';

  static const String pdfDownload = '/pdf_download';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: addLabReport,
      page: () => AddLabReport(),
      bindings: [
        AddLabReportBinding(),
      ],
    ),
    GetPage(
      name: viewLabReport,
      page: () => ViewLabReport(),
      bindings: [
        ViewLabReportBinding(),
      ],
    ),
    GetPage(
      name: updateLabReport,
      page: () => UpdateLabReport(),
      bindings: [
        UpdateLabReportBinding(),
      ],
    ),
  ];
}