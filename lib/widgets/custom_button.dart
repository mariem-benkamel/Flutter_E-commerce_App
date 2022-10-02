import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onPress;

  CustomButton({required this.onPress, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 0, 30, 108),
      ),
      child: CustomText(
          alignment: Alignment.center,
          text: text,
          color: Colors.white,
          fontSize: 18),
    );

    // FlatButton(
    //   shape: new RoundedRectangleBorder(
    //     borderRadius: new BorderRadius.circular(10.0),
    //   ),
    //   padding: EdgeInsets.all(20),
    //   onPressed: onPress,
    //   color: primarycolor,
    //   child: CustomText(
    //       alignment: Alignment.center,
    //       text: text,
    //       color: Colors.white,
    //       fontSize: 18),
    // );
  }
}
