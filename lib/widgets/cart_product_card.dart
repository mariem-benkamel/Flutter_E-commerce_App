// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:last_try/blocs/cart/cart_bloc.dart';
// import 'package:last_try/models/product_model.dart';

// class CartProductCart extends StatelessWidget {
//   final Product product;
//   final int quantity;
//   const CartProductCart(
//       {Key? key, required this.product, required this.quantity})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//           Image.network(
//             product.imageUrl,
//             width: 100,
//              height: 80,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 Text("${product.price}",
//                     style: Theme.of(context).textTheme.bodyLarge),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           BlocBuilder<CartBloc, CartState>(
//             builder: (context, state) {
//               return Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         context.read<CartBloc>().add(RemoveProduct(product));
//                       },
//                       icon: Icon(Icons.remove_circle)),
//                   Text("$quantity",
//                       style: Theme.of(context).textTheme.headline6),
//                   IconButton(
//                     onPressed: () {
//                       context.read<CartBloc>().add(AddProduct(product));
//                     },
//                     icon: Icon(Icons.add_circle),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
