import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iti/constants/theme.dart';
import 'package:iti/screens/widgets/customButton.dart';
import 'package:iti/screens/widgets/itemReview.dart';

class Reviews extends StatelessWidget {
  List<Widget> reviews = const [
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Jenny Wilson',
      rate: 3.2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Ronald Richards',
      rate: 4.2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Guy Hawkins',
      rate: 2.2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Savannah Nguyen',
      rate: 2.1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vLorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vLorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Jenny Wilson',
      rate: 3.2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Ronald Richards',
      rate: 4.2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Guy Hawkins',
      rate: 2.2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
    itemReview(
      imageProfile: 'assets/images/noUser.png',
      name: 'Savannah Nguyen',
      rate: 2.1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      date: '13 sep, 2023',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: Themes().subHeadingStyle,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(flex: 14),
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(initialColor),
                ),
                icon: const Icon(Icons.edit, color: white),
                label: const Text(
                  'Add review',
                  style: TextStyle(color: white),
                ),
              ),
              const Spacer(),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return reviews[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
