// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti/controllers/cubits/orders_cubit.dart';
import '../../constants/routes.dart';
import '../../constants/theme.dart';
import '../onBoarding/firstPage1.dart';
import '../../widgets/customButton.dart';
import '../../widgets/priceTile.dart';

class orderConfirm extends StatelessWidget {
  const orderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                    return priceTile(
                      label: 'Total',
                      size: 18,
                      weight: FontWeight.w600,
                      price: double.parse(
                        BlocProvider.of<OrdersCubit>(context)
                            .Total
                            .toStringAsFixed(1),
                      ),
                    );
                  },
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
