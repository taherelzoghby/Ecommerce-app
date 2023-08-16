import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Info'),
        backgroundColor: initialColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to our eCommerce app! We offer a wide range of products for your shopping needs. Browse through our catalog and find the perfect items for you.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'If you have any questions or concerns, please feel free to reach out to our customer support team. You can contact us via email or phone.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Please review our terms and conditions before using our app and making any purchases. By using our app, you agree to abide by our terms and conditions.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
