import 'package:flutter/material.dart';
import 'package:moneyplan/app/core/colors.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key, required this.fontSize, required this.title, required this.onTap,
  });

  final double fontSize;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
          side: const BorderSide(
              width: 2, color: AppColors.primary),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              color: AppColors.primary),
        ));
  }
}