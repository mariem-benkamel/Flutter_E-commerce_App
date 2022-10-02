import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField1 extends StatelessWidget {
  final String text;
  final String hint;
  final FormFieldSetter<String>? onSave;
  final FormFieldValidator<String>? validator;
  CustomTextFormField1({
    Key? key,
    this.hint = "",
    this.text = "",
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
