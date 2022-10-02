import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPress;

  CustomButtonSocial(
      {this.text = "", required this.imageName, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade200,
      ),
      child: FlatButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 80,
            ),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
