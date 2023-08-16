// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iti/screens/widgets/priceTile.dart';
import 'package:iti/screens/widgets/showDialog.dart';
import 'package:provider/provider.dart';

import 'package:iti/screens/widgets/customButton.dart';

import '../constants/colors.dart';
import '../controllers/controllerProvider.dart';
import '../models/order.dart';
import 'widgets/cardItem.dart';
import 'widgets/orderEmptyWidget.dart';

class cartsPage extends StatelessWidget {
  const cartsPage({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<ProductOrder> orders = context.watch<controller>().ordersProduct;
    controller read = context.read<controller>();
    controller watch = context.watch<controller>();
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///carts title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Text(
                'Carts',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
            //orders content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //orders is empty or not
                    orders.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return CardItem(order: orders[index]);
                            },
                          )
                        : const orderEmptyWidget(),
                  ],
                ),
              ),
            ),
            //order info
            Container(
              height: height * .2,
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order info",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    //subtotal
                    priceTile(
                      label: 'subtotal',
                      price: double.parse(watch.subTotal.toStringAsFixed(1)),
                    ),
                    //shipping cost
                    priceTile(
                      label: 'shipping cost',
                      price: watch.shippingCost,
                    ),
                    SizedBox(height: height * .001),
                    //total
                    priceTile(
                      label: 'Total',
                      price: double.parse(watch.Total.toStringAsFixed(1)),
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    //checkout button
                    customButton(
                      label: 'Checkout',
                      on_tab: () {
                        read.checkOut();
                        show_dialog(
                          context,
                          title: 'Successfully',
                          content: priceTile(
                            label: 'Total',
                            price: double.parse(watch.Total.toStringAsFixed(1)),
                            size: 16,
                            weight: FontWeight.w600,
                          ),
                          actions: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: customButton(
                                label: 'Ok',
                                on_tab: () => Navigator.of(context).pop(),
                                color: initialColor,
                              ),
                            ),
                          ],
                        );
                      },
                      color: initialColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
