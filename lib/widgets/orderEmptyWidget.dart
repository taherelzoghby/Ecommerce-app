import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class orderEmptyWidget extends StatelessWidget {
  const orderEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * .25),
        Center(
          child: SvgPicture.asset(
            'assets/images/empty.svg',
            semanticsLabel: 'Acme Logo',
            height: height * .25,
            width: width * .4,
          ),
        ),
        SizedBox(height: height * .02),
        const Text(
          "Orders is Empty..",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
