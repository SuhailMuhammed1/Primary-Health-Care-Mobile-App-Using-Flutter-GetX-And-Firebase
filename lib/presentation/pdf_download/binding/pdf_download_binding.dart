import 'package:get/get.dart';
import 'package:phc_lab/presentation/pdf_download/controller/pdf_download_controller.dart';

class PdfDownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PdfDownloadController());
  }
}