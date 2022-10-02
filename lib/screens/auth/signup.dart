import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_field1.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SignupScreen(),
    );
  }

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              // Get.off(LoginView());
              Navigator.pushNamed(context, '/login');
            },
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 20,
          left: 20,
        ),
        child: Form(
          // key: _formkey,
          child: Column(
            children: [
              CustomText(text: "Sign Up ", fontSize: 30),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField1(
                text: 'Name',
                hint: "Enter your name  ",
                onSave: (value) {
                  // controller.name = value as String;
                },
                validator: (String? value) {
                  if (value == null) {
                    print('Error ');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField1(
                text: 'Email',
                hint: "test@gmail.com ",
                onSave: (value) {
                  // controller.email = value?.trim() as String;
                },
                validator: (String? value) {
                  if (value == null) {
                    print('Error ');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField1(
                text: 'Password',
                hint: "*********** ",
                onSave: (value) {
                  // controller.password = value.toString();
                },
                validator: (value) {
                  if (value == null) {
                    print('Error ');
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                onPress: () {
                  // _formkey.currentState!.save();
                  // if (_formkey.currentState!.validate()) {}
                  // controller.createUserWithEmailAndPassword();
                },
                text: "SIGN UP",
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
