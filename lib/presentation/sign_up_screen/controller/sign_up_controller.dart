import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'package:phc_lab/Firebase_authentication/signup_email_password_failure.dart';
import 'package:phc_lab/Firebase_authentication/user_model.dart';
import 'package:phc_lab/Firebase_authentication/user_repository.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final username = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());


  Future<void> registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    } catch (error) {
      if (error is SignUpWithEmailAndPasswordFailure) {
        throw error;
      } else {
        throw SignUpWithEmailAndPasswordFailure("An error occurred during registration.");
      }
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }


  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> agreeCheckBox = false.obs;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

}

