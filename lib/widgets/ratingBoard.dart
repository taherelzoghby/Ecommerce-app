import 'package:flutter/material.dart';

import '../constants/theme.dart';
import 'starRating.dart';

class rating extends StatelessWidget {
  const rating({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$rate",
              style: Themes().titleStyle,
            ),
            const Text(
              " rating",
              style: TextStyle(
                fontSize: 12,
                color: thColor,
              ),
            ),
          ],
        ),
        StarRating(rating: rate.toInt())
      ],
    );
  }
}
