// ignore_for_file: non_constant_identifier_names

import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/logout_dialog/models/logout_model.dart';

/// A controller class for the SignUpSuccessDialog.
///
/// This class manages the state of the SignUpSuccessDialog, including the
/// current signUpSuccessModelObj
class LogOutController extends GetxController {
  Rx<LogOutModel> LogOutModelObj = LogOutModel().obs;
}
