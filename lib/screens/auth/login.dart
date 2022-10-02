import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_button_social.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      print(FirebaseAuth.instance);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
        ),
        child: Form(
          // key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Welcome ,", fontSize: 30),
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: (() {
                          // Get.to(RegisterView());
                          Navigator.pushNamed(context, '/signup');
                        }),
                        child: CustomText(
                          text: "Sign Up",
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 30, 108),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to Continue",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Email',
                        fontSize: 14,
                        color: Colors.grey.shade900,
                      ),
                      TextFormField(
                        controller: _emailController,
                        onSaved: (newValue) {},
                        validator: (String? value) {
                          if (value == null) {
                            print('Error ');
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "test@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Password',
                        fontSize: 14,
                        color: Colors.grey.shade900,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        onSaved: (newValue) {},
                        validator: (String? value) {
                          if (value == null) {
                            print('Error ');
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "***********",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                    text: "Forgot Password?",
                    fontSize: 14,
                    alignment: Alignment.topRight),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPress: () {
                    signIn();
                  },
                  text: "SIGN IN",
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: "Sign In with Google",
                  imageName: "assets/images/google.png",
                  onPress: () {
                    // controller.googleSignInMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
