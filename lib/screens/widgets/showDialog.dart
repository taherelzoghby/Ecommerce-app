import 'package:flutter/material.dart';

Future<void> show_dialog(BuildContext context,
    {required String title,
    required Widget content,
    required List<Widget> actions}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      );
    },
  );
}
