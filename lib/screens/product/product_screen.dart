// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:last_try/blocs/cart/cart_bloc.dart';
// import 'package:last_try/blocs/wishlist/wishlist_bloc.dart';
// import 'package:last_try/models/models.dart';
// import 'package:last_try/widgets/custom_appbar.dart';
// import 'package:last_try/widgets/custom_navbar.dart';
// import 'package:last_try/widgets/hero_carousel_cart.dart';

// import '../../blocs/wishlist/wishlist_state.dart';

// class ProductScreen extends StatelessWidget {
//   const ProductScreen({Key? key, required this.product}) : super(key: key);
//   static const String routeName = "/product";

//   static Route route({required Product product}) {
//     return MaterialPageRoute(
//       builder: (context) => ProductScreen(product: product),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   final Product product;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: product.name),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.black,
//         child: Container(
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.share,
//                       color: Colors.white,
//                     )),
//                 BlocBuilder<WishlistBloc, WishlistState>(
//                   builder: (context, state) {
//                     return IconButton(
//                         onPressed: () {
//                           context
//                               .read<WishlistBloc>()
//                               .add(AddProductToWishlist(product));
//                           final snackBar = SnackBar(
//                               content: Text('Added to your wishlist !!'));
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                         },
//                         icon: Icon(
//                           Icons.favorite,
//                           color: Colors.white,
//                         ));
//                   },
//                 ),
//                 BlocBuilder<CartBloc, CartState>(
//                   builder: (context, state) {
//                     return ElevatedButton(
//                         style: ElevatedButton.styleFrom(primary: Colors.white),
//                         onPressed: () {
//                           context.read<CartBloc>().add(AddProduct(product));
//                           Navigator.pushNamed(context, "/cart");
//                         },
//                         child: Text(
//                           'ADD TO CART ',
//                           style: Theme.of(context).textTheme.headline6,
//                         ));
//                   },
//                 )
//               ],
//             )),
//       ),
//       body: ListView(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               aspectRatio: 1.5,
//               viewportFraction: 0.9,
//               enlargeCenterPage: true,
//               enlargeStrategy: CenterPageEnlargeStrategy.height,
//               autoPlay: true,
//             ),
//             items: [
//               HeroCarouselCart(
//                 product: product,
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Stack(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 60,
//                   alignment: Alignment.bottomCenter,
//                   color: Color.fromARGB(255, 0, 0, 0).withAlpha(50),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(5.0),
//                   width: MediaQuery.of(context).size.width - 10,
//                   height: 50,
//                   alignment: Alignment.bottomCenter,
//                   color: Colors.black,
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               product.name,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline6!
//                                   .copyWith(color: Colors.white),
//                             ),
//                             Text(
//                               "${product.price} TND",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline6!
//                                   .copyWith(color: Colors.white),
//                             ),
//                           ]),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: ExpansionTile(
//               initiallyExpanded: true,
//               title: Text("Product Information ",
//                   style: Theme.of(context).textTheme.headline5),
//               children: [
//                 ListTile(
//                   title: Text(
//                     "leflkzglke  jhezjk oezkptorjzotjork  jrtjnrjgtnru' ktpo' jgfjrehjg koekrdn jnfjgre fkezjl oekte kfoernv jfie frkl",
//                     style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: ExpansionTile(
//               title: Text("Delivery Information ",
//                   style: Theme.of(context).textTheme.headline5),
//               children: [
//                 ListTile(
//                   title: Text(
//                     "leflkzglke  jhezjk oezkptorjzotjork  jrtjnrjgtnru' ktpo' jgfjrehjg koekrdn jnfjgre fkezjl oekte kfoernv jfie frkl",
//                     style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),

//       //  HerCarouselCart(
//       //   product: product,
//       // ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
        product: product,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [HeroCarouselCart(product: product)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 232, 99, 10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Product Information",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
