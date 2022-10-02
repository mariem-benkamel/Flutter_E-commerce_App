// import 'package:flutter/material.dart';
// import 'package:last_try/models/category_model.dart';
// import 'package:last_try/models/models.dart';
// import 'package:last_try/screens/catalog/catalog_screen.dart';
// import 'package:last_try/screens/checkout/checkout_screen.dart';
// import 'package:last_try/screens/screens.dart';
// import 'package:last_try/screens/wishlist/wishlist_screen.dart';

// import '../blocs/auth/auth_bloc.dart';
// import '../screens/order_confirmation/order_confirmation_screen.dart';

// class AppRouter {
//   static Object onGenerateRoute(
//     RouteSettings settings,
//   ) {
//     print("this is the route name : ${settings.name}");

//     switch (settings.name) {
//       case "/":
//         return HomeScreen.route();
//       case HomeScreen.routeName:
//         return HomeScreen.route();
//       case SplashScreen.routeName:
//         return SplashScreen.route();
//       case CartScreen.routeName:
//         return CartScreen.route();
//       case ProductScreen.routeName:
//         return ProductScreen.route(product: settings.arguments as Product);
//       case WishlistScreen.routeName:
//         return WishlistScreen.route();
//       case CatalogScreen.routeName:
//         return CatalogScreen.route(category: settings.arguments as Category);
//       case CheckoutScreen.routeName:
//         return CheckoutScreen.route();
//       case OrderConfirmation.routeName:
//         return OrderConfirmation.route();
//       case PaymentSelection.routeName:
//         return PaymentSelection.route();
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(title: Text(" Error")),
//         body: const Center(
//           child: Text('Something went wrong!'),
//         ),
//       ),
//       settings: RouteSettings(name: "/error"),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:last_try/screens/auth/login.dart';
import 'package:last_try/screens/auth/signup.dart';
import 'package:last_try/screens/main_screen.dart';
import '../screens/admin/home_screen.dart';
import '../screens/admin/new_product_screen.dart';
import '../screens/admin/orders_screen.dart';
import '../screens/admin/products_screen.dart';
import '../screens/user/user_screen.dart';
import '/models/models.dart';
import '/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderConfirmation.routeName:
        return OrderConfirmation.route();
      case PaymentSelection.routeName:
        return PaymentSelection.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case HomeScreenAdmin.routeName:
        return HomeScreenAdmin.route();
      case OrdersScreen.routeName:
        return OrdersScreen.route();
      case ProductsScreenAdmin.routeName:
        return ProductsScreenAdmin.route();
      case NewProductScreen.routeName:
        return NewProductScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case MainPage.routeName:
        return MainPage.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
