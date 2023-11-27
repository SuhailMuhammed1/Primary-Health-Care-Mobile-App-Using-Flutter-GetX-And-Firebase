import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'package:phc_lab/Firebase_authentication/user_repository.dart';
import 'package:phc_lab/core/app_export.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {

  Rx<bool> isShowPassword = true.obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    }
    else {
      Get.snackbar("Error", "Login to continue");
    }
  }


}
