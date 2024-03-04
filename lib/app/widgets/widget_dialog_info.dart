import 'package:flutter/material.dart';
import 'package:moneyplan/app/core/colors.dart';

class AlertDialogInfo{

  static Future<void> showAlertDialog(
      BuildContext context,
      bool dismissible,
      String title,
      String content,
      String buttonText,
      VoidCallback onPressed) async {

    // set up the buttons
    Widget button =
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          fixedSize: const Size(150, 35),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
      child: Text(buttonText,
          style: const TextStyle(color: Colors.white)),);

    AlertDialog alert = AlertDialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7)),
      title: Text(title),
      content: Text(content),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        button
      ],
    );

    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}