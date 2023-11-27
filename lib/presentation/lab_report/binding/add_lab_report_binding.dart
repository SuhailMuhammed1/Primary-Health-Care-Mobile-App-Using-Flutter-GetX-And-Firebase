import 'package:get/get.dart';
import 'package:phc_lab/presentation/lab_report/controller/add_lab_report_controller.dart';

class AddLabReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddLabReportController());
  }
}