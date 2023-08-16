import 'dart:io';

import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class photoWidgetFile extends StatelessWidget {
  const photoWidgetFile({
    Key? key,
    required this.image,
    required this.on_tap,
  }) : super(key: key);

  final File? image;
  final void Function() on_tap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * .2,
      width: width * .4,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: image != null
                ? ClipOval(
                    child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                  ))
                : Image.asset('assets/images/noUser.png'),
          ),
          TextButton.icon(
            label: const Text(
              'Edit photo',
              style: TextStyle(color: thColor),
            ),
            onPressed: on_tap,
            icon: const Icon(Icons.edit, color: thColor),
          )
        ],
      ),
    );
  }
}
