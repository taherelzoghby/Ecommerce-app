// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/controllers/cubits/orders_cubit.dart';
import 'package:iti/widgets/itemReview.dart';

import 'package:iti/constants/theme.dart';
import 'package:iti/models/product.dart';
import 'package:iti/widgets/customButton.dart';
import 'package:iti/widgets/showToast.dart';

// ignore: camel_case_types
class detailsPage extends StatelessWidget {
  detailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OrdersCubit bloc = BlocProvider.of<OrdersCubit>(context);
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                //photo appbar
                SliverAppBar(
                  leading: IconButton(
                    color: initialColor,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(scColor),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(product.image, fit: BoxFit.fill),
                  ),
                  expandedHeight: height * .35,
                  pinned: true,
                  backgroundColor: initialColor,
                ),
                //info about product
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //title     price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.category,
                                    style: const TextStyle(color: thColor),
                                  ),
                                  SizedBox(
                                    width: width * 0.7,
                                    child: Text(
                                      product.title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Themes().headingStyle,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Price",
                                    style: TextStyle(color: thColor),
                                  ),
                                  Text(
                                    "\$${product.price}",
                                    style: Themes().titleStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: height * .02),
                          SizedBox(height: height * .02),
                          //description
                          Text(
                            "Description",
                            style: Themes().titleStyle,
                          ),
                          Text(product.description),
                          SizedBox(height: height * .015),
                          //Reviews
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reviews",
                                style: Themes().titleStyle,
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(reviewsPageRoute),
                                child: Text(
                                  "View all",
                                  style: TextStyle(color: initialColor),
                                ),
                              ),
                            ],
                          ),

                          itemReview(
                            imageProfile: 'assets/images/noUser.png',
                            name: 'Mohamed Ahmed',
                            rate: product.rate,
                            content:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                            date: '13 sep, 2023',
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          //total price
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SizedBox(
              height: height * .11,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: Themes().titleStyle,
                      ),
                      Text(
                        "\$${product.price}",
                        style: Themes().titleStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: height * .015),
                  //add to Cart
                  BlocConsumer<OrdersCubit, OrdersState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return customButton(
                        label: 'Add to Cart',
                        on_tab: () {
                          bloc.isOrder(product);
                          if (bloc.flag == true) {
                            showToastt("this Item is already add!");
                          } else {
                            bloc.addOrder(product);
                            showToastt('this Item is added successfully.');
                          }
                        },
                        color: initialColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
