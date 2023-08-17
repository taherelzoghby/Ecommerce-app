// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/theme.dart';

class introPage extends StatelessWidget {
  const introPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * .15),
            SizedBox(
              height: height * .3,
              width: width * .8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SvgPicture.asset(
                  image,
                  semanticsLabel: 'A red up arrow',
                ),
              ),
            ),
            Text(
              title,
              style: Themes().subHeadingStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            Text(
              subTitle,
              style: Themes().bodyStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
