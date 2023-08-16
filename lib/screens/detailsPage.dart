// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iti/constants/colors.dart';
import 'package:iti/controllers/controllerProvider.dart';

import 'package:iti/models/product.dart';
import 'package:iti/screens/widgets/customButton.dart';
import 'package:iti/screens/widgets/showToast.dart';
import 'package:iti/screens/widgets/starRating.dart';
import 'package:provider/provider.dart';

class detailsPage extends StatelessWidget {
  const detailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
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
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: height * .02),
                          //Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Rating",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${product.rate}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        " rating",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: thColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  StarRating(rating: product.rate.toInt())
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: height * .02),
                          //description
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          Text(product.description),
                          SizedBox(height: height * .015),
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
                      const Text(
                        "Total Price",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .015),
                  //add to Cart
                  customButton(
                    label: 'Add to Cart',
                    on_tab: () async {
                      await context.read<controller>().orderOrNot(product);
                      // ignore: use_build_context_synchronously
                      if (context.read<controller>().flag == true) {
                        // ignore: use_build_context_synchronously
                        showToastt("this Item is already add!");
                      } else {
                        // ignore: use_build_context_synchronously
                        await context
                            .read<controller>()
                            .addOrder(product: product);
                        // ignore: use_build_context_synchronously
                        showToastt('this Item is added successfully.');
                      }
                    },
                    color: initialColor,
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
