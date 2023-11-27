import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'package:phc_lab/Firebase_authentication/user_repository.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/delete_account_dialog/models/delete_model.dart';

/// A controller class for the SignUpSuccessDialog.
///
/// This class manages the state of the SignUpSuccessDialog, including the
/// current signUpSuccessModelObj
class DeleteController extends GetxController {
  // ignore: non_constant_identifier_names
  Rx<DeleteModel> DeleteModelObj = DeleteModel().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());


  Future<void> deleteCurrentUser() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      try {
        await _userRepo.deleteUser(email);
      } catch (error) {
        print('Error deleting user: $error');
      }
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

}
