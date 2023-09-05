import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../constants/theme.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushNamed(firstPageRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: initialColor,
        child: Center(
          child: Image.asset('assets/images/Logo.png'),
        ),
      ),
    );
  }
}
