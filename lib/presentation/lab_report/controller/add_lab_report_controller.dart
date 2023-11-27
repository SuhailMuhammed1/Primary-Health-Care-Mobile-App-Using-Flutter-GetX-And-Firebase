// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:flutter/material.dart';

class AddLabReportController extends GetxController {

  final name = TextEditingController().obs;
  final age = TextEditingController().obs;
  final ag_ratio = TextEditingController().obs;
  final alakine_phos = TextEditingController().obs;
  final albumin = TextEditingController().obs;
  final albumin1 = TextEditingController().obs;
  final bacteria = TextEditingController().obs;
  final basophil = TextEditingController().obs;
  final bile_pigment = TextEditingController().obs;
  final bile_salt = TextEditingController().obs;
  final casts = TextEditingController().obs;
  final crystal = TextEditingController().obs;
  final dbilirubin = TextEditingController().obs;
  final dc_neutrophil = TextEditingController().obs;
  final dengue = TextEditingController().obs;
  final eosinophil = TextEditingController().obs;
  final epithelial = TextEditingController().obs;
  final esr = TextEditingController().obs;
  final fbs = TextEditingController().obs;
  final globulin = TextEditingController().obs;
  final hba1c = TextEditingController().obs;
  final hbsag = TextEditingController().obs;
  final hdl = TextEditingController().obs;
  final heamoglobin = TextEditingController().obs;
  final hiv = TextEditingController().obs;
  final ldl = TextEditingController().obs;
  final lgg1gm = TextEditingController().obs;
  final lepto = TextEditingController().obs;
  final lymphocyte = TextEditingController().obs;
  final malarial_parasite = TextEditingController().obs;
  final microscopy = TextEditingController().obs;
  final monocyte = TextEditingController().obs;
  final ns1ag = TextEditingController().obs;
  final platelet_count = TextEditingController().obs;
  final potassium = TextEditingController().obs;
  final ppbs = TextEditingController().obs;
  final puscells = TextEditingController().obs;
  final rbcs = TextEditingController().obs;
  final rbs = TextEditingController().obs;
  final rdt = TextEditingController().obs;
  final screat = TextEditingController().obs;
  final sex = TextEditingController().obs;
  final sgot = TextEditingController().obs;
  final sgpt = TextEditingController().obs;
  final lb_id = TextEditingController().obs;
  final sodium = TextEditingController().obs;
  final sugar = TextEditingController().obs;
  final suricacid = TextEditingController().obs;
  final t_cholestrol = TextEditingController().obs;
  final tbirirubin = TextEditingController().obs;
  final total_wbc_count = TextEditingController().obs;
  final tprotien = TextEditingController().obs;
  final triglycerides = TextEditingController().obs;
  final urea = TextEditingController().obs;
  final vldl = TextEditingController().obs;
  final uid = TextEditingController().obs;
  final op = TextEditingController().obs;
  final doctor = TextEditingController().obs;
  final date = TextEditingController().obs;
  final tech = TextEditingController().obs;
  final selectedSex = RxString('');

  final formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter patient name';
    }
    if (value[0] != value[0].toUpperCase()) {
      return 'Start with a capital letter';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter age';
    }
    int ageValue = int.tryParse(value) ?? 0;
    if (ageValue <= 0 || ageValue > 150) {
      return 'Please enter a valid age';
    }
    return null;
  }

  String? validateSex(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter sex';
    }
    return null;
  }

  String? validateOp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter IP/OP number';
    }
    return null;
  }

  String? validateDoctor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter doctor name';
    }
    if (!value.startsWith('Dr')) {
      return 'Start with "Dr"';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }
    return null;
  }

  String? validateTech(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter lab technician name';
    }
    if (value[0] != value[0].toUpperCase()) {
      return 'Start with a capital letter';
    }
    return null;
  }

  Future<void> selectDate() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      final formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
      date.value.text = formattedDate;
    }
  }

  final CollectionReference lab = FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).collection('lab');

  // Add a method for adding a lab report
  void addReport() {
    final AddLabReportController controller = Get.find<AddLabReportController>();

    final data = {
        'name': controller.name.value.text,
        'age': controller.age.value.text,
        'sex': controller.selectedSex.value,
        'ip_op': controller.op.value.text,
        'doctor': controller.doctor.value.text,
        'date': controller.date.value.text,
        'lab_tech': controller.tech.value.text,
        'haemoglobin': controller.heamoglobin.value.text,
        'wbc': controller.total_wbc_count.value.text,
        'neutrophil': controller.dc_neutrophil.value.text,
        'lymphocyte': controller.lymphocyte.value.text,
        'eosinophil': controller.eosinophil.value.text,
        'basophil': controller.basophil.value.text,
        'monocyte': controller.monocyte.value.text,
        'esr': controller.esr.value.text,
        'platelet': controller.platelet_count.value.text,
        'parasite': controller.malarial_parasite.value.text,
        'albumin': controller.albumin.value.text,
        'sugar': controller.sugar.value.text,
        'microscopy': controller.microscopy.value.text,
        'puscells': controller.puscells.value.text,
        'rbc': controller.rbcs.value.text,
        'epithelial': controller.epithelial.value.text,
        'crystals': controller.crystal.value.text,
        'casts': controller.casts.value.text,
        'bacteria': controller.bacteria.value.text,
        'bile_salt': controller.bile_salt.value.text,
        'bile_pigment': controller.bile_pigment.value.text,
        'sodium': controller.sodium.value.text,
        'potassium': controller.potassium.value.text,
        'fbs': controller.fbs.value.text,
        'rbs': controller.rbs.value.text,
        'ppbs': controller.ppbs.value.text,
        'hba1c': controller.hba1c.value.text,
        't_cholestrol': controller.t_cholestrol.value.text,
        'triglycerides': controller.triglycerides.value.text,
        'hdl': controller.hdl.value.text,
        'ldl': controller.ldl.value.text,
        'vldl': controller.vldl.value.text,
        't_bilirubin': controller.tbirirubin.value.text,
        'd_bilirubin': controller.dbilirubin.value.text,
        'sgot': controller.sgot.value.text,
        'sgpt': controller.sgpt.value.text,
        't_protein': controller.tprotien.value.text,
        'albumin1': controller.albumin1.value.text,
        'globulin': controller.globulin.value.text,
        'a_g_ratio': controller.ag_ratio.value.text,
        'alkaline_phosphatase': controller.alakine_phos.value.text,
        'urea': controller.urea.value.text,
        's_creatinine': controller.screat.value.text,
        's_uric_acid': controller.suricacid.value.text,
        'hiv': controller.hiv.value.text,
        'hbsag': controller.hbsag.value.text,
        'rdt': controller.rdt.value.text,
        'dengue': controller.dengue.value.text,
        'ns_1_ag': controller.ns1ag.value.text,
        'lgg_1gm': controller.lgg1gm.value.text,
        'lepto_lgG_1gM': controller.lepto.value.text,
        'timestamp': FieldValue.serverTimestamp(),
      };
      controller.lab.add(data).whenComplete(() => Get.snackbar('Added',
          'Lab report added successfully.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(5)));
  }

}
