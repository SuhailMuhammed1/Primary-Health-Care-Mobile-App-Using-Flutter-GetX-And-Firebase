// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'controller/pdf_download_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PdfDownload extends StatelessWidget {
  PdfDownload({Key? key}) : super(key: key);

  PdfDownloadController controller = Get.put(PdfDownloadController());

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      maxPageWidth: PdfPageFormat.a4.width,
      canChangeOrientation: false,
      canDebug: false,
      canChangePageFormat: false,
      build: (format) => generateDocument(format)
    );
  }

  Future<void> generateAndShareDocument() async {
    final pdf = await generateDocument(PdfPageFormat.a4);
    final appDocDir = await getApplicationDocumentsDirectory();
    final fileName = '${controller.name.value}_${controller.op.value}.pdf';
    final filePath = '${appDocDir.path}/$fileName';
    final file = File(filePath);

    await file.writeAsBytes(pdf);

    // Share the PDF file
    Share.shareFiles([filePath], text: 'Share PDF');
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);
    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();

    doc.addPage(pw.Page(
      pageTheme: pw.PageTheme(
        pageFormat: format.copyWith(
          marginBottom: 20,
          marginLeft: 20,
          marginRight: 20,
          marginTop: 40,
        ),
        orientation: pw.PageOrientation.portrait,
        theme: pw.ThemeData.withFont(
          base: font1,
          bold: font2,
        ),
      ),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.SizedBox(height: 20),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('PHC MOOKKANNOOR', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                pw.Text('LABORATORY REPORT', style: pw.TextStyle(fontSize: 18)),
                pw.Container(
                  height: 1, // Height of the line
                  width: 185, // Make the line span the entire width of the column
                  color: PdfColors.black, // Color of the line
                ),
              ],
            ),
            pw.SizedBox(height: 40),
            pw.TableHelper.fromTextArray(
              context: context,
              border: pw.TableBorder(),
              data: <List<pw.Widget>>[
                [
                  pw.Text(''),
                  pw.Text(''),
                  pw.Text(''),
                  pw.Text(''),
                  pw.Text(''),
                  pw.Text(''),
                ],
                [
                  pw.Text('Name of the Patient :  ${controller.name.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('Age :  ${controller.age.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('Sex :  ${controller.sex.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
                [
                  pw.Text('IP/OP Number :  ${controller.op.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('Referred by Doctor :  ${controller.doctor.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ],
            ),
            pw.SizedBox(height: 10),
            pw.TableHelper.fromTextArray(
              context: context,
              border: pw.TableBorder.all(color: PdfColors.black, width: 1),
              data: <List<pw.Widget>>[
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Test', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Result', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Normal Value', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Test', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Result', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Normal Value', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                ],
                [
                  pw.Container(
                    // padding: pw.EdgeInsets.only(left: 8, right: 8),
                    alignment: pw.Alignment.center,
                    child: pw.Text('HAEMATOLOGY', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Text(''),
                  pw.Text(''),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Microscopy'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.microscopy.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Haemoglobin'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.heamoglobin.value} gm%'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('12 - 15 gm%'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Puscells'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.puscells.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Total WBC Count'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.total_wbc_count.value} /mm³'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('5000 - 11000'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text("RCB'S"),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.rbcs.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('DC Neutrophil'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.dc_neutrophil.value} %'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('60 - 70'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Epithelial cells'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.epithelial.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Lymphocyte'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.lymphocyte.value} %'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('20 - 40'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Crystals'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.crystal.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Eosinophil'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.eosinophil.value} %'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('1 - 6'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Casts'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.casts.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Basophil'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.basophil.value} %'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('0 - 1'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Bacteria'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.bacteria.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Monocyte'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.monocyte.value} %'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('3 - 4'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Bile Salt'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.bile_salt.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('ESR'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.esr.value} mm/hr'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('0 - 15'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Bile Pigment'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.bile_pigment.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Platelet count'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.platelet_count.value} lakh/mm3'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('1.5 - 4.5'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('BIOCHEMISTRY',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Text(''),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('PARASITOLOGY', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Text(''),
                  pw.Text(''),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('FBS'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.fbs.value} mg%'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('70 - 110'),
                  ),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Malarial Parasite'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.malarial_parasite.value}'),
                  ),
                  pw.Text(''),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('RBS'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.rbs.value} mg%'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('80 - 120'),
                  ),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('URINE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Text(''),
                  pw.Text(''),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('PPBS'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.ppbs.value} mg%'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('90 - 130'),
                  ),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Albumin'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.albumin.value}'),
                  ),
                  pw.Text(''),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('HbA1c'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.hba1c.value}'),
                  ),
                  pw.Text(''),
                ],
                [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Sugar'),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('${controller.sugar.value}'),
                  ),
                  pw.Text(''),
                ],
              ],
            ),
          ],
        );
      },
    ));

    doc.addPage(pw.Page(
      pageTheme: pw.PageTheme(
        pageFormat: format.copyWith(
          marginBottom: 20,
          marginLeft: 20,
          marginRight: 20,
          marginTop: 50,
        ),
        orientation: pw.PageOrientation.portrait,
        theme: pw.ThemeData.withFont(
          base: font1,
          bold: font2,
        ),
      ),        build: (context) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.TableHelper.fromTextArray(
            context: context,
            data: <List<pw.Widget>>[
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Test', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Result', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Normal Value', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Test', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Result', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Normal Value', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('LIPID PROFILE',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Text(''),
                pw.Text(''),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('A/G Ratio'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.ag_ratio.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('T.Cholestrol'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.t_cholestrol.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('150 - 220'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Alkaline Phosphatase'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.alakine_phos.value} IU/L'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('80 - 306'),
                ),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Triglycerides'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.triglycerides.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('60 - 165'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('RFT',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Text(''),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('HDL'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.hdl.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('35 - 80'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Urea'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.urea.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('10 - 50'),
                ),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('LDL'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.ldl.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('< 130'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('S.Creatine'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.screat.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('0.7 - 7.7'),
                ),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('LFT',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Text(''),
                pw.Text(''),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('S.Uric Acid'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.suricacid.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('3.6 - 7.7'),
                ),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('VLDL'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.vldl.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('2 - 30'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('CARD TEST',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Text(''),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('T Bilirubin'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.tbirirubin.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('up to 1.2'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('HIV'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.hiv.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('D Bilirubin'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.dbilirubin.value} mg%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('up to 0.4'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('HBsAg'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.hbsag.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('SGOT'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.sgot.value} IU/L'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('20 - 40'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('RDT (for malaria)'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.rdt.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('SGPT'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.sgpt.value} IU/L'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('20 - 40'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('DENGUE'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.dengue.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('T Protein'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.tprotien.value} gm%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('6.2 - 8.0'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('NS1Ag'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.ns1ag.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Albumin'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.albumin1.value} gm%'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('3.5 - 5.5'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('LgG 1gM'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.lgg1gm.value}'),
                ),
                pw.Text(''),
              ],
              [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Globulin'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.globulin.value} gm%'),
                ),
                pw.Text(''),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Lepto lgG/1gM'),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text('${controller.lepto.value}'),
                ),
                pw.Text(''),
              ],
            ],
          ),
          pw.SizedBox(height: 40),
          pw.Text('Date of reporting :  ${controller.date.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          pw.Text('Name of lab technician :  ${controller.tech.value}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ],
      );
    },
    ));

    final Uint8List pdf = await doc.save();
    return pdf;
  }

}