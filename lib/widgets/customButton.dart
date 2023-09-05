import 'package:flutter/material.dart';

import '../constants/theme.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.label,
    required this.on_tab,
    required this.color,
  });
  final String label;
  final void Function()? on_tab;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: on_tab,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: height * .06,
        width: width * .8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            label,
            style: Themes().subTitle,
          ),
        ),
      ),
    );
  }
}
