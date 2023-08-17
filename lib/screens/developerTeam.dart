import 'package:flutter/material.dart';
import 'package:iti/constants/theme.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              "Taher Amin Taher Elzoghby",
              style: Themes().subHeadingStyle,
            ),
            Text(
              "Software Engineer",
              style: Themes().bodyStyle,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "I'm studing at Faculty of computer and information Tanta University, interested in Flutter Technology.",
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
