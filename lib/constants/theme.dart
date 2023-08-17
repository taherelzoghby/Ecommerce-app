import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//colors
const Color initialColor = Color.fromARGB(255, 178, 161, 224);
const Color scColor = Color.fromARGB(255, 229, 222, 247);
const Color thColor = Colors.grey;
const Color green = Colors.green;
Color backGroundColor = Colors.grey.shade100;
const Color white = Colors.white;
const Color red = Colors.red;

class Themes {
  TextStyle get headingStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: initialColor,
      ),
    );
  }

  TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
    );
  }

  TextStyle get titleStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18,
      ),
    );
  }

  TextStyle get subTitle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }

  TextStyle get bodyStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 17,
      ),
    );
  }

  TextStyle get body2Style {
    return GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}
