import 'package:flutter/material.dart';
import 'package:iti/constants/theme.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Info'),
        backgroundColor: initialColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: Themes().subHeadingStyle,
            ),
            SizedBox(height: height * .02),
            const Text(
              'Welcome to our eCommerce app! We offer a wide range of products for your shopping needs. Browse through our catalog and find the perfect items for you.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: height * .02),
            Text(
              'Contact Us',
              style: Themes().subHeadingStyle,
            ),
            SizedBox(height: height * .02),
            const Text(
              'If you have any questions or concerns, please feel free to reach out to our customer support team. You can contact us via email or phone.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: height * .02),
            Text(
              'Terms and Conditions',
              style: Themes().subHeadingStyle,
            ),
            SizedBox(height: height * .02),
            const Text(
              'Please review our terms and conditions before using our app and making any purchases. By using our app, you agree to abide by our terms and conditions.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
