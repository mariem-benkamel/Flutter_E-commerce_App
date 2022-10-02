import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_try/blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoaded) {
        return Column(
          children: [
            Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUBTOTAL",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "${state.cart.subtotalString}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DELIVERY FEE",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "${state.cart.deliveryFeeString}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(50),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.all(5.0),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 232, 99, 10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          state.cart.totalString + "TND ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Text("something went wrong ");
      }
    });
  }
}
