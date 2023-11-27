import 'package:get/get.dart';
import 'package:phc_lab/presentation/lab_report/controller/update_lab_report_controller.dart';

class UpdateLabReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateLabReportController());
  }
}