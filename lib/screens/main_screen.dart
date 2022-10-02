import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:last_try/screens/auth/login.dart';
import 'package:last_try/screens/screens.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routeName = "/main";

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => MainPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
