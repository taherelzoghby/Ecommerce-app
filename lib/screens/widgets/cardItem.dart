// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iti/controllers/controllerProvider.dart';

import 'package:iti/models/order.dart';
import 'package:provider/provider.dart';

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
    controller read = context.read<controller>();
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    //price
                    Text(
                      "\$${order.product.price}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    //incre   -    decre
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //incre
                        IconButton(
                          onPressed: () => read.addPro(order),
                          icon: const Icon(Icons.add),
                        ),
                        //num
                        Text("${order.orderNumbers}"),
                        //decre
                        IconButton(
                          onPressed: () => read.subPro(order),
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //remove
            IconButton(
              onPressed: () =>
                  context.read<controller>().deleteOrder(documentId: order.id),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
