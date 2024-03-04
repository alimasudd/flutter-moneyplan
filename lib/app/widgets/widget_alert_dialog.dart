import 'package:flutter/material.dart';
import 'package:moneyplan/app/core/colors.dart';

class AlertDialogWidget{

  static Future<void> showAlertDialog(
      BuildContext context,
      String title,
      String content,
      String buttonText,
      VoidCallback onPressed) async {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Batal", style: TextStyle(fontSize: 14, color: AppColors.primary),),
      onPressed:  () => Navigator.of(context, rootNavigator: true).pop(),
    );
    Widget continueButton = TextButton(
        onPressed:  onPressed,
        child: Text(buttonText,
          style: const TextStyle(fontSize: 14, color: AppColors.secondary),)
    );

    AlertDialog alert = AlertDialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7)),
      title: Text(title),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}