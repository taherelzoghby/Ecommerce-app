import 'package:flutter/material.dart';
import 'package:iti/constants/theme.dart';

class tileInfoProfile extends StatelessWidget {
  const tileInfoProfile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.color = Colors.black,
    required this.widget,
  });

  final String title;
  final String subTitle;
  final void Function()? onTap;
  final Color color;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: onTap,
        icon: widget,
      ),
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
    );
  }
}
