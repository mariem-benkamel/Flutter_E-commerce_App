// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:last_try/blocs/cart/cart_bloc.dart';
// import 'package:last_try/blocs/checkout/checkout_bloc.dart';
// import 'package:last_try/blocs/wishlist/wishlist_bloc.dart';
// import 'package:last_try/models/models.dart';

// class CustomNavBar extends StatelessWidget {
//   final String screen;
//   final Product? product;
//   const CustomNavBar({
//     Key? key,
//     required this.screen,
//     this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Color.fromARGB(255, 10, 10, 100),
//       child: Container(
//         height: 70,

//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: _selectNavBar(context, screen)!,
//         ),
//       ),
//     );
//   }

//   List<Widget>? _selectNavBar(context, Screen) {
//     switch (screen) {
//       case "/":
//         return _buildNavBar(context);
//       case "/catalog":
//         return _buildNavBar(context);
//       case "/wishlist":
//         return _buildNavBar(context);
//       case "/order-confirmation":
//         return _buildNavBar(context);
//       case "/product":
//         return _buildAddToCartNavBar(context);
//       case "/cart":
//         return _buildGoToCheckoutNavBar(context);
//       case "/checkout":
//         return _buildOrderNowNavBar(context);
//       default:
//         _buildNavBar(context);
//     }
//   }

//   List<Widget> _buildGoToCheckoutNavBar(context) {
//     return [
//       ElevatedButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/checkout');
//         },
//         style: ElevatedButton.styleFrom(
//           primary: Colors.white,
//           shape: RoundedRectangleBorder(),
//         ),
//         child: Text(
//           "Go to checkout ",
//           style: Theme.of(context).textTheme.headline5,
//         ),
//       ),
//     ];
//   }

//   List<Widget> _buildOrderNowNavBar(context) {
//     return [
//       BlocBuilder<CheckoutBloc, CheckoutState>(
//         builder: (context, state) {
//           if (state is CheckoutLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is CheckoutLoaded) {
//             return ElevatedButton(
//               onPressed: () {
//                 context
//                     .read<CheckoutBloc>()
//                     .add(ConfirmCheckout(checkout: state.checkout));
//                 Navigator.pushNamed(context, "/order-confirmation");
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: RoundedRectangleBorder(),
//               ),
//               child: Text(
//                 "Order Now ",
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//             );
//           } else {
//             return Text('Something went wrong ');
//           }
//         },
//       ),
//     ];
//   }

//   List<Widget>? _buildNavBar(context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.home, color: Colors.white),
//         onPressed: () {
//           Navigator.pushNamed(context, '/');
//         },
//       ),
//       IconButton(
//         icon: Icon(Icons.shopping_cart, color: Colors.white),
//         onPressed: () {
//           Navigator.pushNamed(context, '/cart');
//         },
//       ),
//       IconButton(
//         icon: Icon(Icons.person, color: Colors.white),
//         onPressed: () {
//           Navigator.pushNamed(context, '/user');
//         },
//       )
//     ];
//   }

//   List<Widget>? _buildAddToCartNavBar(context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.share, color: Colors.white),
//         onPressed: () {},
//       ),
//       BlocBuilder<WishlistBloc, WishlistState>(
//         builder: (context, state) {
//           if (state is WishlistLoading) {
//             return CircularProgressIndicator();
//           }
//           if (state is WishlistLoaded) {
//             return IconButton(
//               icon: Icon(Icons.favorite, color: Colors.white),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Added to your Wishlist!'),
//                   ),
//                 );
//                 context
//                     .read<WishlistBloc>()
//                     .add(AddProductToWishlist(product!));
//               },
//             );
//           }
//           return Text('Something went wrong!');
//         },
//       ),
//       BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           if (state is CartLoading) {
//             return CircularProgressIndicator();
//           }
//           if (state is CartLoaded) {
//             return ElevatedButton(
//               onPressed: () {
//                 context.read<CartBloc>().add(AddProduct(product!));
//                 Navigator.pushNamed(context, '/cart');
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: RoundedRectangleBorder(),
//               ),
//               child: Text(
//                 'ADD TO CART',
//                 style: Theme.of(context).textTheme.headline3,
//               ),
//             );
//           }
//           return Text('Something went wrong!');
//         },
//       )
//     ];
//   }
// }
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/wishlist/wishlist_state.dart';
import '../models/payment_method_model.dart';
import '/widgets/widgets.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';
import 'google_pay.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromARGB(255, 0, 30, 108),
      child: Container(
        height: 70,
        child: (screen == '/product')
            ? AddToCartNavBar(product: product!)
            : (screen == '/cart')
                ? GoToCheckoutNavBar()
                : (screen == '/checkout')
                    ? OrderNowNavBar()
                    : HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          color: Color.fromARGB(255, 0, 30, 108),
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/cart');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/user');
            } else {
              // Navigator.pushNamed(context, '/order-confirmation');

              Navigator.pushNamed(context, '/error');
            }
          },
          items: [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.shopping_cart, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ]),
    );

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     IconButton(
    //       icon: Icon(Icons.home, color: Colors.white),
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/');
    //       },
    //     ),
    //     IconButton(
    //       icon: Icon(Icons.shopping_cart, color: Colors.white),
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/cart');
    //       },
    //     ),
    //     IconButton(
    //       icon: Icon(Icons.person, color: Colors.white),
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/user');
    //       },
    //     )
    //   ],
    // );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return CircularProgressIndicator();
            }
            if (state is WishlistLoaded) {
              return IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to your Wishlist!'),
                    ),
                  );
                  context
                      .read<WishlistBloc>()
                      .add(AddProductToWishlist(product));
                },
              );
            }
            return Text('Something went wrong!');
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return CircularProgressIndicator();
            }
            if (state is CartLoaded) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    context.read<CartBloc>().add(AddProduct(product));
                    Navigator.pushNamed(context, "/cart");
                  },
                  child: Text(
                    'ADD TO CART ',
                    style: Theme.of(context).textTheme.headline6,
                  ));
            }
            return Text('Something went wrong!');
          },
        ),
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 232, 99, 10),
              shape: RoundedRectangleBorder(),
            ),
            child: Text(
              'GO TO CHECKOUT',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is CheckoutLoaded) {
              if (state.paymentMethod == PaymentMethod.credit_card) {
                return Container(
                  child: Text(
                    'Pay with Credit Card',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                );
              }
              if (Platform.isAndroid &&
                  state.paymentMethod == PaymentMethod.google_pay) {
                return GooglePay(
                  products: state.products!,
                  total: state.total!,
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment-selection');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'CHOOSE PAYMENT',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              }
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ],
    );
  }
}
