// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti/constants/theme.dart';
import 'package:iti/controllers/cubits/orders_cubit.dart';
import 'package:iti/models/order.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.order,
  }) : super(key: key);
  final ProductOrder order;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            //image
            SizedBox(
              width: width * .31,
              height: height * .13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: order.product.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        placeholder: "assets/images/load.gif",
                        image: order.product.image,
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * .02),
                    //title
                    Text(
                      order.product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Themes().titleStyle,
                    ),
                    //price
                    Text(
                      "\$${order.product.price}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    //incre   -    decre
                    BlocConsumer<OrdersCubit, OrdersState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///incre
                            IconButton(
                              onPressed: () =>
                                  BlocProvider.of<OrdersCubit>(context)
                                      .IncrePrdocustOrders(
                                order,
                              ),
                              icon: const Icon(Icons.add),
                            ),

                            ///num
                            Text("${order.orderNumbers}"),

                            ///decre
                            IconButton(
                              onPressed: () =>
                                  BlocProvider.of<OrdersCubit>(context)
                                      .DecrePrdocustOrders(
                                order,
                              ),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        );
                      },
                      listener: (context, state) {},
                    ),
                  ],
                ),
              ),
            ),
            //remove
            IconButton(
              onPressed: () =>
                  BlocProvider.of<OrdersCubit>(context).deleteOrder(
                order.id,
              ),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
