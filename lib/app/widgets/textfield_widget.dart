import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
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
        SizedBox(
          height: 45,
          child: TextFormField(
            readOnly: readOnly,
            keyboardType: inputType,
            controller: controller,
            style: const TextStyle(fontSize: 15),
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
      ],
    );
  }
}