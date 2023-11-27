import 'package:get/get.dart';
import 'package:phc_lab/presentation/lab_report/controller/view_lab_report_controller.dart';

class ViewLabReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewLabReportController());
  }
}