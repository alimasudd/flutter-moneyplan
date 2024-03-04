import 'package:flutter/material.dart';
import 'package:moneyplan/app/core/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key, required this.width, required this.title, required this.onTap,
  });

  final double width;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          fixedSize: Size(width, 45),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
      child: Text(title,
        style: const TextStyle(color: Colors.white, fontSize: 15),),);
  }
}