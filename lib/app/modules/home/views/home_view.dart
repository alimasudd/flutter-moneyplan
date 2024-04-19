import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moneyplan/app/core/colors.dart';
import 'package:moneyplan/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: () async {
          // Get.toNamed(Routes.ADD_DATA);
          controller.textEncrypt();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: const Text('Home')
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: controller.readRecords(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('${snapshot.error}');
              }else if(snapshot.hasData){
                final records = snapshot.data!;

                return ListView(
                  children: records.map(controller.buildRecord).toList(),
                );
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
    );
  }
}
