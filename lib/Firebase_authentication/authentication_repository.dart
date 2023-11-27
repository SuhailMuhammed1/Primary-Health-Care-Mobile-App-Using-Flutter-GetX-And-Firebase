import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phc_lab/presentation/home_container_screen/home_container_screen.dart';
import 'package:phc_lab/presentation/login_screen/login_screen.dart';
import 'package:phc_lab/presentation/sign_up_screen/sign_up_screen.dart';
import 'delete_user_failure.dart';
import 'login_email_password_failure.dart';
import 'signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    if (_auth.currentUser != null) {
      _setInitialScreen(_auth.currentUser);
    }
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginScreen()) : Get.offAll(() =>  HomeContainerScreen());
  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => HomeContainerScreen()) : Get.to(() => SignUpScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - {ex.message}');
      throw ex;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      print('EXCEPTION - {ex.message}');
      throw ex;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

    Future<void> deleteUser() async {
      try {
        final currentUser = _auth.currentUser;
        if (currentUser != null) {
          await currentUser.delete().whenComplete(() => Get.snackbar('Deleted',
              'Account deleted successfully.',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.all(5)));
        }
      } on FirebaseAuthException catch (e) {
        final ex = DeleteUserFailure.code(e.code);
        print('FIREBASE AUTH EXCEPTION - ${ex.message}');
        throw ex;
      } catch (_) {
        final ex = DeleteUserFailure();
        print('EXCEPTION - {ex.message}');
        throw ex;
      }
    }


}