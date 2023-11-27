import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVector,
                          width: 130.h),
                      SizedBox(height: 15.v),
                      Text("lbl_phc".tr,
                          style: theme.textTheme.displayMedium?.copyWith(fontStyle: FontStyle.italic,fontSize: 40)),
                      SizedBox(height: 5.v),
                      Text("lbl_mookkannoor".tr,
                          style: theme.textTheme.displayMedium?.copyWith(fontStyle: FontStyle.italic,fontSize: 40)),
                    ]))));
  }
}
