import 'package:flutter/material.dart';

class circularIndicator extends StatelessWidget {
  const circularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .36,
        ),
        const CircularProgressIndicator(),
      ],
    );
  }
}
