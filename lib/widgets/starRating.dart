import 'package:flutter/material.dart';

import 'starIcon.dart';

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < rating) {
          return const StarIcon(isFilled: true);
        } else {
          return const StarIcon(isFilled: false);
        }
      }),
    );
  }
}
