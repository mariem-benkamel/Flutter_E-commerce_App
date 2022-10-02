import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:last_try/screens/admin/products_screen.dart';
import '../../controllers/order_stats_controller.dart';
import '../../models/order_stats_model.dart';

import '/screens/screens.dart';
import '/models/models.dart';
import 'orders_screen.dart';

class HomeScreenAdmin extends StatelessWidget {
  HomeScreenAdmin({Key? key}) : super(key: key);
  static const String routeName = '/admin';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => HomeScreenAdmin(),
    );
  }

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Panel admin')),
        backgroundColor: Color.fromARGB(255, 0, 30, 108),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: orderStatsController.stats.value,
              builder: (context, AsyncSnapshot<List<OrderStats>> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 250,
                    padding: const EdgeInsets.all(10),
                    child: CustomBarChart(
                      orderStats: snapshot.data!,
                      // orderStats: OrderStats.data,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 232, 99, 10),
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  // Get.to(() => ProductsScreen());
                  Navigator.pushNamed(context, '/productadmin');
                },
                child: const Card(
                  child: Center(
                    child: Text('Voir les produits'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  // Get.to(() => OrdersScreen());
                  Navigator.pushNamed(context, '/order');
                },
                child: const Card(
                  child: Center(
                    child: Text('Voir les ordres'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    Key? key,
    required this.orderStats,
  }) : super(key: key);

  final List<OrderStats> orderStats;
  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderStats, String>> series = [
      charts.Series(
          id: "orders",
          data: orderStats,
          domainFn: (series, _) =>
              DateFormat.d().format(series.dateTime).toString(),
          measureFn: (series, _) => series.orders,
          colorFn: (series, _) => series.barColor!)
    ];

    return charts.BarChart(series, animate: true);
  }
}
