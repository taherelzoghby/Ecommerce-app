import 'package:flutter/material.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/constants/theme.dart';
import 'package:iti/controllers/controllerProvider.dart';
import 'package:iti/screens/onBoarding/firstPage1.dart';
import 'package:iti/screens/productsPage.dart';
import 'package:iti/screens/widgets/customButton.dart';
import 'package:iti/screens/widgets/priceTile.dart';
import 'package:provider/provider.dart';

class orderConfirm extends StatelessWidget {
  const orderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    controller watch = context.watch<controller>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            const introPage(
              image: 'assets/images/orderConf.svg',
              title: "Order Confirmed!",
              subTitle:
                  "Your order has been confirmed, we will send you confirmation email shortly.",
            ),
            Align(
              alignment: const Alignment(0, .35),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: priceTile(
                  label: 'Total',
                  size: 18,
                  weight: FontWeight.w600,
                  price: double.parse(watch.Total.toStringAsFixed(1)),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, .78),
              child: customButton(
                label: "continue shopping",
                on_tab: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  homePageRoute,
                  arguments: '',
                  (route) => false,
                ),
                color: initialColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
