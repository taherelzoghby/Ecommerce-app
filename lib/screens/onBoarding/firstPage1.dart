import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class firstPage1 extends StatelessWidget {
  const firstPage1({super.key});

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
                  "assets/images/shop.svg",
                  semanticsLabel: 'A red up arrow',
                ),
              ),
            ),
            const Text(
              'Find your favourite items',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            const Text(
              'Find your favourite products\n that you need to buy daily.',
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
