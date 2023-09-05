// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/constants/theme.dart';
import 'package:iti/controllers/cubits/orders_cubit.dart';
import 'package:iti/widgets/customButton.dart';
import 'package:iti/widgets/priceTile.dart';
import 'package:iti/widgets/showDialog.dart';
import '../../models/order.dart';
import '../../widgets/cardItem.dart';
import '../../widgets/orderEmptyWidget.dart';

// ignore: must_be_immutable
class cartsPage extends StatelessWidget {
  const cartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    OrdersCubit bloc = BlocProvider.of<OrdersCubit>(context);
    bloc.getOrders();
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingOrders) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorOrders) {
              return const Center(child: Text('Error'));
            } else {
              List<ProductOrder> orders = bloc.ordersProduct;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///carts title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 18,
                    ),
                    child: Text(
                      'Carts',
                      style: Themes().subHeadingStyle,
                    ),
                  ),

                  ///orders content
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
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      child: SlideAnimation(
                                        verticalOffset: 60,
                                        child: FadeInAnimation(
                                          child: CardItem(order: orders[index]),
                                        ),
                                      ),
                                    );
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order info",
                            style: Themes().titleStyle,
                          ),

                          ///subtotal
                          priceTile(
                            label: 'subtotal',
                            price: double.parse(
                              bloc.subTotal.toStringAsFixed(1),
                            ),
                          ),

                          ///shipping cost
                          priceTile(
                            label: 'shipping cost',
                            price: bloc.shippingCost,
                          ),
                          SizedBox(height: height * .001),

                          ///total
                          priceTile(
                            label: 'Total',
                            price: double.parse(bloc.Total.toStringAsFixed(1)),
                            size: 16,
                            weight: FontWeight.w600,
                          ),
                          //checkout button
                          customButton(
                            label: 'Checkout',
                            on_tab: () {
                              bloc.checkOut();
                              if (orders.isEmpty) {
                                show_dialog(
                                  context,
                                  title: 'Not orders',
                                  content: const priceTile(
                                    label: 'Total',
                                    price: 0,
                                    size: 15,
                                    weight: FontWeight.w500,
                                  ),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: customButton(
                                        label: 'Ok',
                                        on_tab: () =>
                                            Navigator.of(context).pop(),
                                        color: initialColor,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                Navigator.of(context).pushNamed(
                                  orderConfimedPageRoute,
                                );
                              }
                            },
                            color: initialColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
