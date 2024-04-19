import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moneyplan/app/core/colors.dart';
import 'package:moneyplan/app/data/manage_model.dart';

class AddDataController extends GetxController {

  final controllerNote = TextEditingController();
  final controllerAmount = TextEditingController();
  final controllerDate = TextEditingController();


  pickDate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context as BuildContext,
        initialDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary, // <-- SEE HERE
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(1980),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now()
    );

    if (dateTime != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      //you can implement different kind of Date Format here according to your requirement
      controllerDate.text = formattedDate;
    }
  }

  Future createRecord (ManageModel user) async {
    final docRecords = FirebaseFirestore.instance.collection('records').doc();

    user.id = docRecords.id;

    final json = user.toJson();
    await docRecords.set(json);
  }

}
