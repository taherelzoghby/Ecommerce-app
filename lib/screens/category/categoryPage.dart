import 'package:flutter/material.dart';
import '../../constants/theme.dart';

import '../../models/category.dart';
import '../../widgets/itemCategory.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  List<Category> categories = [
    Category(
      title: "electronics",
      image:
          "https://www.polytechnichub.com/wp-content/uploads/2017/04/Electronic.jpg",
    ),
    Category(
      title: "jewelery",
      image:
          "https://ion.r2net.com/images/HomePage/SpecialGalleriesBanner/N/Mobile/Vertical/DiamondStuds.jpg",
    ),
    Category(
      title: "men's clothing",
      image:
          "https://images.squarespace-cdn.com/content/v1/5a456ab97131a596e33c3d21/1652729957817-LIZW1BSVZU1IIAV36DU7/IMG-4860.jpg?format=1000w",
    ),
    Category(
      title: "women's clothing",
      image:
          "https://media.istockphoto.com/id/935032524/photo/women-summer-dresses-on-display-at-camden-market.jpg?s=612x612&w=0&k=20&c=_L2DC3Fq4wST3v9fsonpJzARWpMibAVtWUkZXPrQALs=",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor.withOpacity(.2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //category title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Text(
                'Categories',
                style: Themes().subHeadingStyle,
              ),
            ),
            //categories content
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 3.5 / 4,
              ),
              children: categories
                  .map(
                    (e) => itemCategory(category: e),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
