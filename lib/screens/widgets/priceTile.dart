import 'package:flutter/material.dart';
import '../../constants/theme.dart';

class priceTile extends StatelessWidget {
  const priceTile(
      {Key? key,
      required this.label,
      required this.price,
      this.size = 14,
      this.weight = FontWeight.w200})
      : super(key: key);
  final String label;
  final double price;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: weight,
            fontSize: size,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$price',
          style: Themes().body2Style,
        ),
      ],
    );
  }
}
