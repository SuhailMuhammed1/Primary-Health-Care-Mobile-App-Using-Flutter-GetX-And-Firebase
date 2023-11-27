import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/core/utils/validation_functions.dart';
import 'package:phc_lab/presentation/login_screen/controller/login_controller.dart';
import 'package:phc_lab/widgets/app_bar/appbar_subtitle.dart';
import 'package:phc_lab/widgets/custom_elevated_button.dart';
import 'package:phc_lab/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: AppbarSubtitle(text: "lbl_login".tr,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold, // Specify the font weight
                                fontSize: 20),),
                          ),
                          SizedBox(height: 50.v),
                          CustomTextFormField(
                              autofocus: false,
                              controller: controller.email,
                              hintText: "msg_enter_your_email".tr,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      24.h, 16.v, 16.h, 16.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 56.v),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "err_msg_please_enter_valid_email".tr;
                                }
                                return null;
                              },
                              contentPadding: EdgeInsets.only(
                                  top: 18.v, right: 12.h, bottom: 18.v)),
                          SizedBox(height: 16.v),
                          Obx(() => CustomTextFormField(
                              autofocus: false,
                              controller: controller.password,
                              hintText: "msg_enter_your_password".tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      24.h, 16.v, 16.h, 16.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgLock,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 56.v),
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          12.h, 16.v, 24.h, 16.v),
                                      child: CustomImageView(
                                          imagePath: controller.isShowPassword.value ?
                                              ImageConstant.imgEyeSlash : ImageConstant.imgEye,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize))),
                              suffixConstraints:
                                  BoxConstraints(maxHeight: 56.v),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "err_msg_please_enter_valid_password"
                                      .tr;
                                }
                                return null;
                              },
                              obscureText: controller.isShowPassword.value)),
                          SizedBox(height: 32.v),
                          CustomElevatedButton(
                              text: "lbl_login".tr,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.login();
                                }
                              }),
                          SizedBox(height: 25.v),
                          Padding(
                              padding: EdgeInsets.only(left: 48.h),
                              child: Row(
                                   children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 1.v),
                                    child: Text("msg_don_t_have_an_account".tr,
                                        style: CustomTextStyles
                                            .bodyMediumGray600)),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtSignUp();
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .titleSmallPrimary_1)))
                              ])),
                        ])))));
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }

}
