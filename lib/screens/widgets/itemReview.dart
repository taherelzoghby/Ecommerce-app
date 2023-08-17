// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:iti/screens/widgets/ratingBoard.dart';

class itemReview extends StatelessWidget {
  const itemReview({
    Key? key,
    required this.imageProfile,
    required this.name,
    required this.date,
    required this.rate,
    required this.content,
  }) : super(key: key);
  final String imageProfile;
  final String name;
  final String date;
  final double rate;
  final String content;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: height * .065,
                  width: width * .15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      imageProfile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //info
              SizedBox(
                height: height * .06,
                width: width * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              //rating
              rating(rate: rate),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
