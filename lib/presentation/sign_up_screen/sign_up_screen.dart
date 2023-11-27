import 'package:phc_lab/Firebase_authentication/signup_email_password_failure.dart';
import 'package:phc_lab/Firebase_authentication/user_model.dart';
import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/core/utils/validation_functions.dart';
import 'package:phc_lab/widgets/app_bar/appbar_subtitle.dart';
import 'package:phc_lab/widgets/custom_elevated_button.dart';
import 'package:phc_lab/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());


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
                              child: AppbarSubtitle(text: "lbl_sign_up_1".tr,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, // Specify the font weight
                                    fontSize: 20),),
                            ),
                            SizedBox(height: 21.v),
                            _buildNameEditText(),
                            SizedBox(height: 16.v),
                            _buildEmailEditText(),
                            SizedBox(height: 16.v),
                            _buildPasswordEditText(),
                            SizedBox(height: 29.v),
                            _buildSignUpButton(),
                            SizedBox(height: 26.v),
                            Padding(
                                padding: EdgeInsets.only(left: 44.h),
                                child: Row(children: [
                                  Text("msg_already_have_an".tr,
                                      style: CustomTextStyles.bodyMediumGray600),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtLogIn();
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 4.h),
                                          child: Text("lbl_log_in2".tr,
                                              style: CustomTextStyles
                                                  .titleSmallPrimary_1)))
                                ])),
                            SizedBox(height: 5.v),
                          ]))),
            ));
  }

  /// Section Widget
  Widget _buildNameEditText() {
    return CustomTextFormField(
        autofocus: false,
        controller: controller.username,
        hintText: "lbl_enter_your_name".tr,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isText(value, isRequired: true))) {
            return "err_msg_please_enter_valid_text".tr;
          }
          if (value.isNotEmpty && value[0] != value[0].toUpperCase()) {
            return "err_msg_first_character_must_be_uppercase".tr;
          }
          return null;
        },
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildEmailEditText() {
    return CustomTextFormField(
        autofocus: false,
        controller: controller.email,
        hintText: "msg_enter_your_email".tr,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildPasswordEditText() {
    return Obx(() => CustomTextFormField(
        autofocus: false,
        controller: controller.password,
        hintText: "msg_enter_your_password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value =
                  !controller.isShowPassword.value;
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
                child: CustomImageView(
                    imagePath: controller.isShowPassword.value ? ImageConstant.imgEyeSlash : ImageConstant.imgEye,
                    height: 24.adaptSize,
                    width: 24.adaptSize))),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value));
  }

  /// Section Widget
  Widget _buildSignUpButton() {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          onTapSignUpButton();
        });
  }

  void onTapSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      try {
        final email = controller.email.text.trim();
        final password = controller.password.text.trim();
        await SignUpController.instance.registerUser(email, password);

        final user = UserModel(
          username: controller.username.text.trim(),
          email: email,
          password: password,
        );

        SignUpController.instance.createUser(user);
      } catch (error) {
        if (error is SignUpWithEmailAndPasswordFailure) {
          Get.snackbar(
            "Sign Up Error",
            error.message,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red,
            duration: Duration(seconds: 5),
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(5),
          );
        } else {
          Get.showSnackbar(GetSnackBar(
            message: 'An error occurred during registration.',
          ));
        }
      }
    }
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLogIn() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

}
