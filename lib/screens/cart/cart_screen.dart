// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:last_try/blocs/cart/cart_bloc.dart';
// import 'package:last_try/models/cart_model.dart';
// import 'package:last_try/models/product_model.dart';
// import 'package:last_try/widgets/cart_product_card.dart';
// import 'package:last_try/widgets/custom_appbar.dart';
// import 'package:last_try/widgets/custom_navbar.dart';
// import 'package:last_try/widgets/order_summary.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//   static const String routeName = "/cart";

//   static Route route() {
//     return MaterialPageRoute(
//       builder: (context) => CartScreen(),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: " Cart "),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.black,
//         child: Container(
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.white),
//                   onPressed: () {},
//                   child: Text(
//                     'GO TO CHECKOUT ',
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                 ),
//               ],
//             )),
//       ),
//       body: BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           if (state is CartLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is CartLoaded) {
//             Map cart = state.cart.productQuantity(state.cart.products);

//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             state.cart.freeDeliveryString,
//                             style: Theme.of(context).textTheme.bodyText1,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/');
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 primary: Colors.black,
//                                 shape: RoundedRectangleBorder(),
//                                 elevation: 0),
//                             child: Text(
//                               'Add more items ',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyText1!
//                                   .copyWith(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         height: 400,
//                         child: ListView.builder(
//                           itemCount: state.cart
//                               .productQuantity(state.cart.products)
//                               .keys
//                               .length,
//                           itemBuilder: (context, index) {
//                             return CartProductCart(
//                               product: state.cart
//                                   .productQuantity(state.cart.products)
//                                   .keys
//                                   .elementAt(index),
//                               quantity: state.cart
//                                   .productQuantity(state.cart.products)
//                                   .values
//                                   .elementAt(index),
//                             );
//                           },
//                         ),
//                       ),
//                       OrderSummary(),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Text("Something went wrong ");
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Panier'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is CartLoaded) {
            Map cart = state.cart.productQuantity(state.cart.products);
            if (cart.keys.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/cart_empty.svg",
                        width: 200, height: 200),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Empty cart",
                      style: Theme.of(context).textTheme.headline4!,
                    )
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 30, 108),
                            shape: RoundedRectangleBorder(),
                            elevation: 0,
                          ),
                          child: Text(
                            'Add More Items',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: cart.keys.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard.cart(
                            product: cart.keys.elementAt(index),
                            quantity: cart.values.elementAt(index),
                          );
                        },
                      ),
                    ),
                    OrderSummary(),
                  ],
                ),
              );
            }
          }
          return Text('Something went wrong');
        },
      ),
    );
  }
}
