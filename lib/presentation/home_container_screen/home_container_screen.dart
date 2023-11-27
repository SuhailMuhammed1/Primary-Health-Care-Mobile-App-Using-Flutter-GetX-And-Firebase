import 'package:phc_lab/presentation/logout_dialog/controller/logout_controller.dart';
import 'package:phc_lab/presentation/logout_dialog/logout_dialog.dart';
import 'controller/home_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/home_page/home_page.dart';
import 'package:phc_lab/presentation/profile_page/profile_page.dart';
import 'package:phc_lab/widgets/custom_bottom_bar.dart';

class HomeContainerScreen extends GetWidget<HomeContainerController> {
  const HomeContainerScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: Get.nestedKey(1),
                  initialRoute: AppRoutes.homePage,
                  onGenerateRoute: (routeSetting) => GetPageRoute(
                      page: () => getCurrentPage(routeSetting.name!),
                      transition: Transition.noTransition)),
              bottomNavigationBar: _buildBottomBar())),
    );
  }

  Future<bool> _onWillPop() async {
    _showLogoutDialog();
    return false;
  }


  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Usergray500:
        return AppRoutes.profilePage;
      case BottomBarEnum.poweroffon:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.profilePage:
        return ProfilePage();

      default:
        return DefaultWidget();
    }
  }


  /// Section Widget
  Widget _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary, // Set your desired line color
            width: 3.h, // Set the line thickness
          ),
        ),
      ),
      child: CustomBottomBar(onChanged: (BottomBarEnum type) {
        if (type == BottomBarEnum.poweroffon) {
          // Show the logout confirmation dialog
          _showLogoutDialog();
        } else {
          Get.toNamed(getCurrentRoute(type), id: 1);
        }
      }),
    );
  }


  void _showLogoutDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 0),
      content: LogOutDialog(
        Get.put(
          LogOutController(),
        ),
      ),
    ));
  }


}
