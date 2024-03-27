import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ManageModel {
  String id;
  int amount;
  String category;
  String note;
  String date;

  ManageModel({
    this.id = '',
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
  });

  factory ManageModel.fromJson(Map<String, dynamic> json) => ManageModel(
    id: json["id"] ?? '',
    amount: json["amount"],
    category: json["category"],
    note: json["note"],
    date: DateFormat("dd MMMM yyyy").format(DateTime.parse(json["date"])),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "category": category,
    "note": note,
    "date": date,
  };
}