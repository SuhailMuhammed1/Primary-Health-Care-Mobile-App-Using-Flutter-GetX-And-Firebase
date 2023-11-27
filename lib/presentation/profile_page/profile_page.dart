import 'package:phc_lab/Firebase_authentication/user_model.dart';
import 'package:phc_lab/presentation/delete_account_dialog/controller/delete_controller.dart';
import 'package:phc_lab/presentation/delete_account_dialog/delete_dialog.dart';
import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController());
  UserModel? userData;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData){
                         userData = snapshot.data as UserModel;
                        return Container(
                            color: theme.colorScheme.primary,
                            width: double.maxFinite,
                            child: Column(
                                children: [
                                  SizedBox(height: 200.v),
                                  _buildProfileSection(),
                                  SizedBox(height: 100.v),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 29.v),
                                      decoration: AppDecoration.white.copyWith(
                                          borderRadius: BorderRadiusStyle.customBorderTL30),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 5.v),
                                            _buildEmailSection(),
                                            SizedBox(height: 14.v),
                                            Divider(),
                                            SizedBox(height: 14.v),
                                            _buildPasswordSection(),
                                            SizedBox(height: 14.v),
                                            Divider(),
                                            SizedBox(height: 14.v),
                                            _buildDeleteSection()
                                          ]))
                                ]));
                      }else if(snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString()));
                      }else{
                        return const Center(child: Text("Something went wrong"),);
                      }
                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))));
  }

  /// Section Widget
  Widget _buildProfileSection() {
    return Column(children: [
      SizedBox(
          height: 82.v,
          width: 81.h,
          child: Stack(alignment: Alignment.bottomRight, children: [
            CustomImageView(
                imagePath: ImageConstant.labpro,
                height: 80.adaptSize,
                width: 80.adaptSize,
                radius: BorderRadius.circular(40.h),
                alignment: Alignment.center),
          ])),
      SizedBox(height: 19.v),
      Text(userData!.username.tr,
            style: CustomTextStyles.titleMediumWhiteA700_1)
    ]);
  }

  /// Section Widget
  Widget _buildEmailSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child:Text(
                   userData!.email.tr,
                      style: CustomTextStyles.titleMedium16,
                  ),  ),
      Spacer(),
    ]);
  }


  /// Section Widget
  Widget _buildPasswordSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 12.v),
          child: Obx(
                () => Text(
              controller.isShowPassword.value
                  ? '•' * userData!.password.length
                  : userData!.password.tr, // Show password if isShowPassword is true, else show masked text
              style: CustomTextStyles.titleMedium16,
            ),
          ),),
      Spacer(),
      GestureDetector(
        onTap: () {
          controller.isShowPassword.toggle();
        },
        child: Obx(
              () => CustomImageView(
            imagePath: controller.isShowPassword.value
                ? ImageConstant.imgEyeSlash
                : ImageConstant.imgEye,
            height: 26.v,
            width: 24.h,
            margin: EdgeInsets.only(top: 11.v, bottom: 10.v),
          ),
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildDeleteSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: appTheme.red50,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.trash,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 18.v, bottom: 11.v),
          child: Text("lbl_delete".tr,
              style: CustomTextStyles.titleMediumRedA200)),
      Spacer(),
      CustomImageView(
          onTap: () {
            onTapDeleteButton();
          },
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  onTapDeleteButton() {
      Get.dialog(AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.only(left: 0),
        content: DeleteDialog(
          Get.put(
            DeleteController(),
          ),
        ),
      ));
    }

}
