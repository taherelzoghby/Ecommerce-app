import 'package:flutter/material.dart';

import '../constants/colors.dart';

class developerTeam extends StatelessWidget {
  const developerTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: const Text('Developer Team'),
        backgroundColor: initialColor,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "Taher Amin Taher Elzoghby",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              "Software Engineer",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: thColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "I'm studing at Faculty of computer and information Tanta University, interested in Flutter Technology.",
                style: TextStyle(),
              ),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
