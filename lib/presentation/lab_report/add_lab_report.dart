import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/widgets/app_bar/appbar_leading_image.dart';
import 'package:phc_lab/widgets/app_bar/appbar_subtitle.dart';
import 'package:phc_lab/widgets/app_bar/custom_app_bar.dart';
import 'package:phc_lab/widgets/custom_elevated_button.dart';
import 'controller/add_lab_report_controller.dart';

class AddLabReport extends GetView<AddLabReportController> {
  AddLabReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10.v),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.name.value,
                          decoration: InputDecoration(
                            labelText: 'Patient Name',
                            hintText: "Name Of Patient",
                            prefixIcon: Icon(Icons.personal_injury),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: controller.validateName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.age.value,
                          decoration: InputDecoration(
                            labelText: 'Age',
                            hintText: "Age",
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: controller.validateAge,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: DropdownButtonFormField<String>(
                          value: controller.selectedSex.value.isEmpty
                              ? null
                              : controller.selectedSex.value,
                          onChanged: (String? newValue) {
                            controller.selectedSex.value = newValue ?? '';
                          },
                          items: <String>['Male', 'Female', 'Other']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Sex',
                            hintText: "Select Sex",
                            prefixIcon: Icon(Icons.male),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: controller.validateSex,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.op.value,
                          decoration: InputDecoration(
                            labelText: 'IP/OP Number',
                            hintText: "IP/OP Number",
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: controller.validateOp,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.doctor.value,
                          decoration: InputDecoration(
                            labelText: 'Referred by Doctor',
                            hintText: "Doctor Name",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: controller.validateDoctor,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.date.value,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            hintText: "Date",
                            prefixIcon: Icon(Icons.date_range),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: controller.validateDate,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onTap: () async {
                            controller.selectDate();
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.tech.value,
                          decoration: InputDecoration(
                              labelText: 'Lab Technician',
                              hintText: "Lab Technician Name",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          validator: controller.validateTech,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("HAEMATOLOGY",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.heamoglobin.value,
                          decoration: InputDecoration(
                              labelText: 'Haemoglobin',
                              hintText: "Haemoglobin",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.total_wbc_count.value,
                          decoration: InputDecoration(
                              labelText: 'Total WBC Count',
                              hintText: "Total WBC Count",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.dc_neutrophil.value,
                          decoration: InputDecoration(
                              labelText: 'DC Neutrophil',
                              hintText: "DC Neutrophil",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.lymphocyte.value,
                          decoration: InputDecoration(
                              labelText: 'Lymphocyte',
                              hintText: "Lymphocyte",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.eosinophil.value,
                          decoration: InputDecoration(
                              labelText: 'Eosinophil',
                              hintText: "Eosinophil",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.basophil.value,
                          decoration: InputDecoration(
                              labelText: 'Basophil',
                              hintText: "Basophil",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.monocyte.value,
                          decoration: InputDecoration(
                              labelText: 'Monocyte',
                              hintText: "Monocyte",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.esr.value,
                          decoration: InputDecoration(
                              labelText: 'ESR',
                              hintText: "ESR",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.platelet_count.value,
                          decoration: InputDecoration(
                              labelText: 'Platelet count',
                              hintText: "Platelet count",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("PARASITOLOGY",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.malarial_parasite.value,
                          decoration: InputDecoration(
                              labelText: 'Malarial Parasite',
                              hintText: "Malarial Parasite",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("URINE",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.albumin.value,
                          decoration: InputDecoration(
                              labelText: 'Albumin',
                              hintText: "Albumin",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.sugar.value,
                          decoration: InputDecoration(
                              labelText: 'Sugar',
                              hintText: "Sugar",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.microscopy.value,
                          decoration: InputDecoration(
                              labelText: 'Microscopy',
                              hintText: "Microscopy",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.puscells.value,
                          decoration: InputDecoration(
                              labelText: 'Puscells',
                              hintText: "Puscells",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.rbcs.value,
                          decoration: InputDecoration(
                              labelText: 'RBC s',
                              hintText: "RBC s",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.epithelial.value,
                          decoration: InputDecoration(
                              labelText: 'Epithelial cells',
                              hintText: "Epithelial cells",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.crystal.value,
                          decoration: InputDecoration(
                              labelText: 'Crystals',
                              hintText: "Crystals",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.casts.value,
                          decoration: InputDecoration(
                              labelText: 'Casts',
                              hintText: "Casts",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.bacteria.value,
                          decoration: InputDecoration(
                              labelText: 'Bacteria',
                              hintText: "Bacteria",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.bile_salt.value,
                          decoration: InputDecoration(
                              labelText: 'Bile salt ',
                              hintText: "Bile salt",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.bile_pigment.value,
                          decoration: InputDecoration(
                              labelText: 'Bile pigment ',
                              hintText: "Bile pigment",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("SERUM ELECTROLYTES",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.sodium.value,
                          decoration: InputDecoration(
                              labelText: 'Sodium',
                              hintText: "Sodium",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.potassium.value,
                          decoration: InputDecoration(
                              labelText: 'Potassium',
                              hintText: "Potassium",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("BIOCHEMISTRY",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.fbs.value,
                          decoration: InputDecoration(
                              labelText: 'FBS',
                              hintText: "FBS",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.rbs.value,
                          decoration: InputDecoration(
                              labelText: 'RBS',
                              hintText: "RBS",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.ppbs.value,
                          decoration: InputDecoration(
                              labelText: 'PPBS',
                              hintText: "PPBS",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.hba1c.value,
                          decoration: InputDecoration(
                              labelText: 'HbA1c',
                              hintText: "HbA1c",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("LIPID PROFILE",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.t_cholestrol.value,
                          decoration: InputDecoration(
                              labelText: 'T.Cholestrol',
                              hintText: "T.Cholestrol",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.triglycerides.value,
                          decoration: InputDecoration(
                              labelText: 'T.riglycerides',
                              hintText: "T.riglycerides",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.hdl.value,
                          decoration: InputDecoration(
                              labelText: 'HDL',
                              hintText: "HDL",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.ldl.value,
                          decoration: InputDecoration(
                              labelText: 'LDL',
                              hintText: "LDL",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.vldl.value,
                          decoration: InputDecoration(
                              labelText: 'VLDL',
                              hintText: "VLDL",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("LFT",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.tbirirubin.value,
                          decoration: InputDecoration(
                              labelText: 'T Bilirubin',
                              hintText: "T Bilirubin",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.dbilirubin.value,
                          decoration: InputDecoration(
                              labelText: 'D Bilirubin',
                              hintText: "D Bilirubin",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.sgot.value,
                          decoration: InputDecoration(
                              labelText: 'SGOT',
                              hintText: "SGOT",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.sgpt.value,
                          decoration: InputDecoration(
                              labelText: 'SGPT',
                              hintText: "SGPT",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.tprotien.value,
                          decoration: InputDecoration(
                              labelText: 'T Protein',
                              hintText: "T Protein",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.albumin1.value,
                          decoration: InputDecoration(
                              labelText: 'Albumin',
                              hintText: "Albumin",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.globulin.value,
                          decoration: InputDecoration(
                              labelText: 'Globulin',
                              hintText: "Globulin",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.ag_ratio.value,
                          decoration: InputDecoration(
                              labelText: 'A/G Ratio',
                              hintText: "A/G Ratio",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.alakine_phos.value,
                          decoration: InputDecoration(
                              labelText: 'Alkaline Phosphatase',
                              hintText: "Alkaline Phosphatase",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("RFT",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.urea.value,
                          decoration: InputDecoration(
                              labelText: 'Urea',
                              hintText: "Urea",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.screat.value,
                          decoration: InputDecoration(
                              labelText: 'S Creatinine',
                              hintText: "S Creatinine",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 30),
                        child: TextFormField(
                          controller: controller.suricacid.value,
                          decoration: InputDecoration(
                              labelText: 'S Uric Acid',
                              hintText: "S Uric Acid",
                              prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("CARD TEST",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.hiv.value,
                          decoration: InputDecoration(
                              labelText: 'HIV',
                              hintText: "HIV",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.hbsag.value,
                          decoration: InputDecoration(
                              labelText: 'HBsAg',
                              hintText: "HBsAg",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.rdt.value,
                          decoration: InputDecoration(
                              labelText: 'RDT(for malaria)',
                              hintText: "RDT(for malaria)",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.dengue.value,
                          decoration: InputDecoration(
                              labelText: 'DENGUE',
                              hintText: "DENGUE",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.ns1ag.value,
                          decoration: InputDecoration(
                              labelText: 'Ns 1 Ag',
                              hintText: "Ns 1 Ag",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.lgg1gm.value,
                          decoration: InputDecoration(
                              labelText: 'LsG lgM',
                              hintText: "LsG lgM",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                        child: TextFormField(
                          controller: controller.lepto.value,
                          decoration: InputDecoration(
                              labelText: 'Lepto lgG/lgM',
                              hintText: "Lepto lgG/lgM",
                              // prefixIcon: Icon(Icons.percent),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(height: 40.v),
                      CustomElevatedButton(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        width: 200.h,
                        text: 'lbl_add_report'.tr,
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.addReport();
                            Get.back();
                          } else {
                            Get.snackbar('Report Error',
                                'Please fill in all required fields.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                duration: Duration(seconds: 5),
                                snackPosition: SnackPosition.BOTTOM,
                                margin: EdgeInsets.all(5));
                          }
                        },
                      ),
                      SizedBox(height: 40.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
