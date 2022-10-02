import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:last_try/screens/admin/new_product_screen.dart';
import '../../controllers/controlllers.dart';
import '../../models/product_model.dart';

class ProductsScreenAdmin extends StatelessWidget {
  ProductsScreenAdmin({Key? key}) : super(key: key);

  static const String routeName = '/productadmin';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductsScreenAdmin(),
    );
  }

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Color.fromARGB(255, 0, 30, 108),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: const EdgeInsets.all(10.0),
                color:  Color.fromARGB(255, 0, 30, 108),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/newproduct');
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Add a new product ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 250,
                      child: ProductCard(
                        product: productController.products[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.description,
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                        child: const Text(
                          'price',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Slider(
                          value: product.price,
                          min: 0,
                          max: 500,
                          divisions: 10,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black12,
                          onChanged: (value) {
                            productController.updateProductPrice(
                                index, product, value);
                          },
                          onChangeEnd: (value) {
                            productController.saveNewProductPrice(
                                product, 'price', value);
                          },
                        ),
                      ),
                      Text(
                        '${product.price.toStringAsFixed(1)}TND',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                        child: const Text(
                          'Qty',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Slider(
                        value: product.quantity.toDouble(),
                        min: 0,
                        max: 500,
                        divisions: 10,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        onChanged: (value) {
                          productController.updateProductQuantity(
                              index, product, value.toInt());
                        },
                        onChangeEnd: (value) {
                          productController.saveNewProductQuantity(
                            product,
                            'quantity',
                            value.toInt(),
                          );
                        },
                      ),
                      Text(
                        '${product.quantity.toInt()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // _buildCheckbox(
                  //   'inStock',
                  //   'inStock',
                  //   productController,
                  //   productController.inStock,
                  // )
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

// Row _buildCheckbox(
//   String title,
//   String name,
//   ProductController productController,
//   bool? controllerValue,
// ) {
//   return Row(
//     children: [
//       SizedBox(
//         width: 125,
//         child: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       Checkbox(
//         value: (controllerValue == null) ? false : controllerValue,
//         checkColor: Colors.black,
//         activeColor: Colors.black12,
//         onChanged: (value) {
//           Product product;
//           productController.saveNewProductStock(
//             product,
//             'inStock',
//             value,
//           );
//         },
//       ),
//     ],
//   );
// }
