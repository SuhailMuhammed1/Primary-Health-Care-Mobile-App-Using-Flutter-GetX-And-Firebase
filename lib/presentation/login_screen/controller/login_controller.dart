import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'package:phc_lab/Firebase_authentication/login_email_password_failure.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  final email = TextEditingController();

  final password = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;


  Future<void> login() async {
    try {
      // Attempt to log in
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    } catch (error) {
      if (error is LogInWithEmailAndPasswordFailure) {
        Get.snackbar(
          "Login Error", // Title text
          error.message, // Message text
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red, // Text color
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(5),
        );
      } else {
        // Handle other generic errors
        Get.showSnackbar(GetSnackBar(
          message: 'An error occurred during login.',
        ));
      }
    }
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }


}
