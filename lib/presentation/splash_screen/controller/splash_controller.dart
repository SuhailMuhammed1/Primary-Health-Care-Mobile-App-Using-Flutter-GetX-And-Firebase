import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/home_container_screen/home_container_screen.dart';
import 'package:phc_lab/presentation/login_screen/login_screen.dart';
import 'package:phc_lab/presentation/splash_screen/models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      final user = AuthenticationRepository.instance.firebaseUser.value;
      if (user != null) {
        Get.offAll(() => HomeContainerScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    }
    );
  }
}
