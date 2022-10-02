import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_text_form_field.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Commande'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      title: 'Email',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(email: value));
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      title: 'Full Name',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      title: 'Address',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      title: 'City',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      title: 'Country',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      title: 'ZIP Code',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipCode: value));
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 99, 10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/payment-selection',
                                );
                              },
                              child: Text(
                                'SELECT A PAYMENT METHOD',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'ORDER SUMMARY',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    OrderSummary()
                  ],
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
