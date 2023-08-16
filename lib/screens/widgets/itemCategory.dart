// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/models/category.dart';

class itemCategory extends StatelessWidget {
  const itemCategory({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushReplacementNamed(produPage, arguments: category.title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: height * .19,
                width: width * .45,
                child: category.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        placeholder: "assets/images/load.gif",
                        image: category.image,
                      )
                    : Image.asset("assets/images/somethingWrong.gif"),
              ),
            ),
            Text(
              category.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
