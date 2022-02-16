import 'package:bhojan/models/models.dart';
import 'package:bhojan/widgets/custom_appbar.dart';
import 'package:bhojan/widgets/custom_navbar.dart';
import 'package:bhojan/widgets/order_summary.dart';
import 'package:bhojan/widgets/order_summary_product_card.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmation(),
    );
  }

  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order confirmation'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 300,
                  width: double.infinity,
                ),
                Positioned(
                    top: 50,
                    right: (MediaQuery.of(context).size.width - 500) / 2,
                    child: Image.asset('assets/fonts/images/Order.jpg'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER CODE:124603",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Your Order is Confirmed !"
                    "  Thank You For Purchasing",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ORDER CODE:124603",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const OrderSummary(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ORDER DETAILS",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCard(
                        product: Product.products[1],
                        quantity: 2,
                      ),
                      OrderSummaryProductCard(
                        product: Product.products[3],
                        quantity: 2,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
