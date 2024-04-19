import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneyplan/app/data/manage_model.dart';
import 'package:moneyplan/app/utils/currency.dart';

class HomeController extends GetxController {

  final textController = TextEditingController();

  Stream<List<ManageModel>> readRecords() => FirebaseFirestore.instance
      .collection('records')
  .snapshots()
  .map((snapshot) =>
  snapshot.docs.map((e) => ManageModel.fromJson(e.data())).toList());

  Future<ManageModel?> readUser() async{
    final docUser = FirebaseFirestore.instance.collection('records').doc('my-id');
    final snapshot = await docUser.get();

    if(snapshot.exists){
      return ManageModel.fromJson(snapshot.data()!);
    }
  }

  Widget buildRecord(ManageModel manage) => ListTile(
    leading: const CircleAvatar(child: Icon(CupertinoIcons.money_dollar_circle),),
    title: Text(CurrencyFormat.convertToIdr(manage.amount, 0), style: const TextStyle(fontSize: 20),),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(manage.date, style: const TextStyle(fontWeight: FontWeight.bold),),
        Text(manage.note),
      ],
    ),
  );

  Future<void> fetchUsers() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return users.get()
        .then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        debugPrint('${doc.id} => ${doc.data()}');
      }
    })
        .catchError((error) => debugPrint("Failed to fetch users: $error"));
  }

  void textEncrypt(){
    const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = encrypt.Key.fromLength(16);
    final iv = encrypt.IV.fromLength(8);
    final encrypter = encrypt.Encrypter(encrypt.Salsa20(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    debugPrint(encrypted.base64);
    debugPrint(decrypted);
  }

}

//
// class User {
//   String id;
//   final String name;
//   final int age;
//   final DateTime birthday;
//
//   User({
//     this.id = '',
//     required this.name,
//     required this.age,
//     required this.birthday,
//   });
//
//   Map<String, dynamic> toJson() =>{
//     'id' : id,
//     'name' : name,
//     'age' : age,
//     'birthday' : birthday
//   };
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"] ?? '',
//     name: json["name"],
//     age: json["age"],
//     birthday: (json["birthday"] as Timestamp).toDate(),
//   );
// }
