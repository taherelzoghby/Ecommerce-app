import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti/constants/theme.dart';

class firstPage2 extends StatelessWidget {
  const firstPage2({super.key});

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
                  "assets/images/delivery.svg",
                  semanticsLabel: 'A red up arrow',
                ),
              ),
            ),
            Text(
              'Product Delivery',
              style: Themes().subHeadingStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            Text(
              'Yours products are delivered\n    home safely & security.',
              style: Themes().bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
