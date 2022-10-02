// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:last_try/blocs/wishlist/wishlist_bloc.dart';
// import 'package:last_try/models/product_model.dart';
// import 'package:last_try/widgets/custom_appbar.dart';
// import 'package:last_try/widgets/custom_navbar.dart';
// import 'package:last_try/widgets/product_card.dart';

// class WishListScreen extends StatelessWidget {
//   const WishListScreen({Key? key}) : super(key: key);
//   static const String routeName = "/wishlist";

//   static Route route() {
//     return MaterialPageRoute(
//       builder: (context) => WishListScreen(),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: " Wishlist "),
//       bottomNavigationBar: CustomNavbar(screen: routeName),
//       body: BlocBuilder<WishlistBloc, WishlistState>(
//         builder: (context, state) {
//           if (state is WishlistLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is WishlistLoaded) {
//             return GridView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1, childAspectRatio: 2.2),
//               itemCount: state.wishlist.products.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ProductCard(
//                   product: state.wishlist.products[index],
//                   widthFactor: 1.1,
//                   leftPosition: 100,
//                   isWhislist: true,
//                 );
//               },
//             );
//           } else {
//             return Text('Somthing went wrong ');
//           }
//         },
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/wishlist/wishlist_state.dart';
import '/blocs/wishlist/wishlist_bloc.dart';
import '/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favoris'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is WishlistLoaded) {
            if (state.wishlist.products.length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/cart.svg",
                        width: 200, height: 200),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Empty Wishlist",
                      style: Theme.of(context).textTheme.headline4!,
                    )
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.25,
                  ),
                  itemCount: state.wishlist.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: ProductCard.wishlist(
                        product: state.wishlist.products[index],
                      ),
                    );
                  },
                ),
              );
            }
          }
          return Text('Something went wrong!');
        },
      ),
    );
  }
}
