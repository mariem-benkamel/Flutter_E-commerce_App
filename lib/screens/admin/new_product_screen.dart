import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';
import '../../services/database_service.dart';
import '../../services/storage_service.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/newproduct';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => NewProductScreen(),
    );
  }

  final ProductController productController = Get.find();

  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    List<String> categories = [
      'École',
      "Ordinateur",
      'Sac à dos',
      "Composants d'ordinateur",
      " TV",
      "Accessoires informatiques",
      "Smartphone",
    ];
    var controllerValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        backgroundColor: Color.fromARGB(255, 0, 30, 108),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Color.fromARGB(255, 0, 30, 108),
                    child: InkWell(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Ajouter une image',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);

                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Aucune image n/’a été sélectionnée '),
                              ),
                            );
                          }

                          if (image != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('image sélectionnée'),
                              ),
                            );
                            await storage.uploadImage(image);
                            var imageUrl =
                                await storage.getDownloadURL(image.name);

                            productController.newProduct.update(
                                'imageUrl', (_) => imageUrl,
                                ifAbsent: () => imageUrl);
                          }
                        }),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Information sur le produit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // _buildTextFormField(
                //   'Product id',
                //   'id',
                //   productController,
                // ),
                _buildTextFormField(
                  'Nom du produit',
                  'name',
                  productController,
                ),
                _buildTextFormField(
                  'Description du produit',
                  'description',
                  productController,
                ),
                DropdownButtonFormField(
                  iconSize: 20,
                  decoration:
                      const InputDecoration(hintText: 'Catégorie de produits'),
                  items: categories.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    productController.newProduct.update(
                      'category',
                      (_) => value,
                      ifAbsent: () => value,
                    );
                  },
                ),
                const SizedBox(height: 30),
                _buildSliderp(
                  'Prix',
                  'price',
                  productController,
                  productController.price,
                ),

                _buildSliderQ(
                  'Quantité',
                  'quantity',
                  productController,
                  productController.quantity,
                ),

                const SizedBox(height: 10),
                _buildCheckbox(
                  'inStock',
                  'inStock',
                  productController,
                  productController.inStock,
                ),
                _buildCheckbox(
                  'Popular',
                  'isPopular',
                  productController,
                  productController.isPopular,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      database.addProduct(
                        Product(
                          id: productController.newProduct['id'],
                          name: productController.newProduct['name'],
                          category: productController.newProduct['category'],
                          description:
                              productController.newProduct['description'],
                          imageUrl: productController.newProduct['imageUrl'],
                          inStock:
                              productController.newProduct['inStock'] ?? false,
                          isPopular:
                              productController.newProduct['isPopular'] ??
                                  false,
                          price: productController.newProduct['price'],
                          quantity:
                              productController.newProduct['quantity'].toInt(),
                        ),
                      );
                      print(productController.newProduct['imageUrl']);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Product Added with sucess !'),
                        ),
                      );
                      Navigator.pop(context, false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 232, 99, 10),
                    ),
                    child: const Text(
                      'Enregistrer',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCheckbox(
    String title,
    String name,
    ProductController productController,
    bool? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }

  Row _buildSliderp(
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0,
            max: 500,
            divisions: 50,
            activeColor: Color.fromARGB(255, 232, 99, 10),
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
        Text(
          '${productController.price}TND',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _buildSliderQ(
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0,
            max: 200,
            divisions: 10,
            activeColor: Color.fromARGB(255, 232, 99, 10),
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
        Text(
          '${productController.quantity}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    ProductController productController,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct.update(
          name,
          (_) => value,
          ifAbsent: () => value,
        );
      },
    );
  }
}
