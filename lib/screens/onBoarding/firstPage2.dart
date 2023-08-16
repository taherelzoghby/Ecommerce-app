import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            const Text(
              'Product Delivery',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            const Text(
              'Yours products are delivered\n    home safely & security.',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
