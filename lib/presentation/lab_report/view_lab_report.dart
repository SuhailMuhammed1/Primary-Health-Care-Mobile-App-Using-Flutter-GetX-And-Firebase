import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/presentation/pdf_download/controller/pdf_download_controller.dart';
import 'package:phc_lab/presentation/pdf_download/pdf_download.dart';
import 'package:phc_lab/widgets/app_bar/appbar_leading_image.dart';
import 'package:phc_lab/widgets/app_bar/appbar_subtitle.dart';
import 'package:phc_lab/widgets/app_bar/custom_app_bar.dart';
import 'controller/view_lab_report_controller.dart';

class ViewLabReport extends GetView<ViewLabReportController> {
  ViewLabReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            controller.toggleSortingOrder();
          },
          label: Obx(() {
            return Text(
              controller.isDescendingOrder.value
                  ? 'Sort New'
                  : 'Sort Old',
              style: TextStyle(fontSize: 16,
              color: Colors.white),
            );
          }),
          icon: Obx(() {
            return Icon(
              controller.isDescendingOrder.value
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              size: 22,
              color: Colors.white,
            );
          }),
        ),
        body: Obx(() {
          final isDescendingOrder = controller.isDescendingOrder.value;
          return StreamBuilder(
            stream: controller.lab.orderBy('timestamp', descending: isDescendingOrder).snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot labSnap = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: AppDecoration.fillBlue.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    child: CircleAvatar(
                                      backgroundColor: theme.colorScheme.primary,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${labSnap['ip_op']}/${labSnap['name']}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          color: appTheme.black900,
                                        ),
                                      ),
                                      Text(
                                        '${labSnap['timestamp'] != null ? DateFormat('dd-MM-yy <=> HH:mm a').format(labSnap['timestamp'].toDate()) : "N/A"}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          color: appTheme.black900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRoutes.updateLabReport,
                                          arguments: {
                                            'id': labSnap.id,
                                            'name': labSnap['name'],
                                            'age': labSnap['age'].toString(),
                                            'sex': labSnap['sex'],
                                            'ip_op': labSnap['ip_op'].toString(),
                                            'doctor': labSnap['doctor'],
                                            'date': labSnap['date'].toString(),
                                            'lab_tech': labSnap['lab_tech'],
                                            'haemoglobin': labSnap['haemoglobin']
                                                .toString(),
                                            'wbc': labSnap['wbc'].toString(),
                                            'neutrophil': labSnap['neutrophil']
                                                .toString(),
                                            'lymphocyte': labSnap['lymphocyte']
                                                .toString(),
                                            'eosinophil': labSnap['eosinophil']
                                                .toString(),
                                            'basophil': labSnap['basophil']
                                                .toString(),
                                            'monocyte': labSnap['monocyte']
                                                .toString(),
                                            'esr': labSnap['esr'].toString(),
                                            'platelet': labSnap['platelet']
                                                .toString(),
                                            'parasite': labSnap['parasite']
                                                .toString(),
                                            'albumin': labSnap['albumin']
                                                .toString(),
                                            'sugar': labSnap['sugar'].toString(),
                                            'microscopy': labSnap['microscopy']
                                                .toString(),
                                            'puscells': labSnap['puscells']
                                                .toString(),
                                            'rbc': labSnap['rbc'].toString(),
                                            'epithelial': labSnap['epithelial']
                                                .toString(),
                                            'crystals': labSnap['crystals']
                                                .toString(),
                                            'casts': labSnap['casts'].toString(),
                                            'bacteria': labSnap['bacteria']
                                                .toString(),
                                            'bile_salt': labSnap['bile_salt']
                                                .toString(),
                                            'bile_pigment': labSnap['bile_pigment']
                                                .toString(),
                                            'sodium': labSnap['sodium'].toString(),
                                            'potassium': labSnap['potassium']
                                                .toString(),
                                            'fbs': labSnap['fbs'].toString(),
                                            'rbs': labSnap['rbs'].toString(),
                                            'ppbs': labSnap['ppbs'].toString(),
                                            'hba1c': labSnap['hba1c'].toString(),
                                            't_cholestrol': labSnap['t_cholestrol']
                                                .toString(),
                                            'triglycerides': labSnap['triglycerides']
                                                .toString(),
                                            'hdl': labSnap['hdl'].toString(),
                                            'ldl': labSnap['ldl'].toString(),
                                            'vldl': labSnap['vldl'].toString(),
                                            't_bilirubin': labSnap['t_bilirubin']
                                                .toString(),
                                            'd_bilirubin': labSnap['d_bilirubin']
                                                .toString(),
                                            'sgot': labSnap['sgot'].toString(),
                                            'sgpt': labSnap['sgpt'].toString(),
                                            't_protein': labSnap['t_protein']
                                                .toString(),
                                            'albumin1': labSnap['albumin1']
                                                .toString(),
                                            'globulin': labSnap['globulin']
                                                .toString(),
                                            'a_g_ratio': labSnap['a_g_ratio']
                                                .toString(),
                                            'alkaline_phosphatase': labSnap['alkaline_phosphatase']
                                                .toString(),
                                            'urea': labSnap['urea'].toString(),
                                            's_creatinine': labSnap['s_creatinine']
                                                .toString(),
                                            's_uric_acid': labSnap['s_uric_acid']
                                                .toString(),
                                            'hiv': labSnap['hiv'].toString(),
                                            'hbsag': labSnap['hbsag'].toString(),
                                            'rdt': labSnap['rdt'].toString(),
                                            'dengue': labSnap['dengue'].toString(),
                                            'ns_1_ag': labSnap['ns_1_ag']
                                                .toString(),
                                            'lgg_1gm': labSnap['lgg_1gm']
                                                .toString(),
                                            'lepto_lgG_1gM': labSnap['lepto_lgG_1gM']
                                                .toString(),
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.edit),
                                      color: Colors.blue,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.deleteReport(labSnap.id);
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Get.to(PdfDownload());
                                        PdfDownloadController pdfDownloadController = Get.find<PdfDownloadController>();
                                        pdfDownloadController.initializeData(labSnap);
                                      },
                                      icon: Icon(Icons.download),
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          );
        }),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90.v), // Adjust the height as needed
      child: Column(
        children: [
          CustomAppBar(
            leadingWidth: 64.h,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 24.h),
              onTap: () {
                onTapArrowLeft();
              },
              iconColor: theme.colorScheme.primary,
            ),
            centerTitle: true,
            height: 80.v,
            title: AppbarSubtitle(
              text: "lbl_lab_report".tr,
              textStyle: CustomTextStyles.titleLargeSemiBold,
            ),
          ),
          Divider(
            thickness: 3.h,
            color: theme.colorScheme.primary, // Set your desired line color
          ),
        ],
      ),
    );
  }

  onTapArrowLeft() {
    Get.back();
  }

}

   