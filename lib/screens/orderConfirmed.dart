import 'package:flutter/material.dart';
import 'package:iti/constants/theme.dart';
import 'package:iti/screens/onBoarding/firstPage1.dart';
import 'package:iti/screens/widgets/customButton.dart';

class orderConfirm extends StatelessWidget {
  const orderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          introPage(
            image: 'assets/images/orderConfirmed.png',
            title: "Order Confirmed!",
            subTitle:
                "Your order has been confirmed, we will send you confirmation email shortly.",
          ),
          customButton(
            label: "continue shopping",
            on_tab: () {},
            color: initialColor,
          ),
        ],
      ),
    );
  }
}
