import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moneyplan/app/core/colors.dart';

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
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: TextField(
          controller: controller.textController,
        ),
        actions: [
          IconButton(
              onPressed: (){
                controller.createUser(
                    name: controller.textController.text);
                },
              icon: Icon(Icons.add))
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: controller.readUsers(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('${snapshot.error}');
              }else if(snapshot.hasData){
                final users = snapshot.data!;

                return ListView(
                  children: users.map(controller.buildUser).toList(),
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
