import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../blocs/blocs.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/user';

  const UserScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => UserScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        // automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          // color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: AssetImage(
                            "assets/images/avatar.png",
                          )),
                        ),
                        // Column(
                        //   children: [
                        //     CustomText(
                        //         text: controller.userModel!.name,
                        //         color: Colors.black,
                        //         fontSize: 24),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     CustomText(
                        //         text: controller.userModel!.email,
                        //         color: Colors.black,
                        //         fontSize: 16),
                        //   ],
                        // ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text: 'Edit Profile '),
                      leading:
                          Image.asset("assets/menu_icon/Icon_Edit-Profile.png"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text: 'Shipping Address '),
                      leading:
                          Image.asset("assets/menu_icon/Icon_Location.png"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text: 'Order History '),
                      leading: Image.asset("assets/menu_icon/Icon_History.png"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text: 'Cards '),
                      leading: Image.asset("assets/menu_icon/Icon_Payment.png"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text: 'Notifications '),
                      leading: Image.asset("assets/menu_icon/Icon_Alert.png"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {
                      // controller.signOut();
                      // Get.offAll(LoginView());
                    },
                    child: ListTile(
                      title: CustomText(text: 'Log Out'),
                      leading: Image.asset("assets/menu_icon/Icon_Exit.png"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
