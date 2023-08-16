import 'package:flutter/material.dart';
import 'package:iti/constants/colors.dart';

class tileInfoProfile extends StatelessWidget {
  const tileInfoProfile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.color = Colors.black,
  });

  final String title;
  final String subTitle;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: white,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      subtitle: Text(subTitle),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(Icons.arrow_right, color: color),
      ),
    );
  }
}
