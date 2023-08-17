import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/product.dart';

// ignore: camel_case_types
class itemProduct extends StatelessWidget {
  const itemProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(detailPageRoute, arguments: product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: height * .19,
              width: width * .45,
              child: product.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      fit: BoxFit.fill,
                      placeholder: "assets/images/load.gif",
                      image: product.image,
                    )
                  : Image.asset("assets/images/somethingWrong.gif"),
            ),
          ),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
