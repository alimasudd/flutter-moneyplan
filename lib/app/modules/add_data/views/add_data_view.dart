import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moneyplan/app/data/manage_model.dart';
import 'package:moneyplan/app/widgets/button_widget.dart';
import 'package:moneyplan/app/widgets/textfield_widget.dart';

import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  const AddDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pengeluaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                  controller: controller.controllerAmount,
                  title: 'Harga',
                  inputType: TextInputType.number,
                  readOnly: false),

              const SizedBox(height: 20,),
              TextFieldWidget(
                  controller: controller.controllerNote,
                  title: 'Catatan',
                  inputType: TextInputType.text,
                  readOnly: false),

              const SizedBox(height: 20,),
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
                child: Text(
                  'Tanggal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: TextFormField(
                  onTap: ()=> controller.pickDate(),
                  readOnly: true,
                  controller: controller.controllerDate,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10),
                    fillColor: Colors.grey.shade600,
                    filled: false,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

              const SizedBox(height: 30,),
              ButtonWidget(
                  width: 200,
                  title: 'Submit',
                  onTap: (){
                    final record = ManageModel(
                        amount: int.parse(controller.controllerAmount.text),
                        note: controller.controllerNote.text,
                        date: controller.controllerDate.text,
                        category: 'money');
                    controller.createRecord(record);

                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      )
    );
  }
}
