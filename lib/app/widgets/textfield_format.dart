import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyplan/app/utils/TextFieldFormat.dart';

class TextFieldFormat extends StatelessWidget {
  const TextFieldFormat({
    super.key,
    required this.controller, required this.title, required this.inputType, required this.readOnly,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType inputType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 50,
            child: TextFormField(
              readOnly: readOnly,
              inputFormatters: [
                ThousandsFormatter(),
              ],
              keyboardType: inputType,
              textAlign: TextAlign.center,
              controller: controller,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
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
        ),
      ],
    );
  }
}