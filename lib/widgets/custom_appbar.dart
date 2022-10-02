import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            color: Color.fromARGB(255, 0, 30, 108),
            //  Color.fromARGB(255, 10, 10, 100),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white)),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 30, 108)),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            },
            icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
