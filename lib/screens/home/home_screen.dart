import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/product_model.dart';
import '../../widgets/custom_text.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Accueil',
          // automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: state.categories
                          .map((category) =>
                              HeroCarouselCart(category: category))
                          .toList());
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
            const SectionTitle(title: 'Recommandé'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  var productCarousel = ProductCarousel(
                    products: state.products
                        .where((element) => !element.inStock)
                        .toList(),
                  );
                  return productCarousel;
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
            // ProductCarousel(
            //   products:
            //       Product.products.where((element) => element.inStock).toList(),
            // ),
            const SectionTitle(title: 'Le plus populaire'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((element) => !element.isPopular)
                        .toList(),
                  );
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
