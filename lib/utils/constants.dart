import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(
    0xFF80CBC4,
);

void goTo(BuildContext context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => nextScreen,
        ));
}

dialogueBox(BuildContext context, String text){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}

progressIndicator(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
          child: CircularProgressIndicator(
            backgroundColor: primaryColor,
            color: Colors.teal.shade500,
            strokeWidth: 4,
          )));
}

final poppins = GoogleFonts.poppins();
const blue = Color(0xFF2596be);
const orange = Colors.orange;
const black = Colors.black;
const green = Colors.green;
const white = Colors.white;
const red = Colors.red;
const transparent = Colors.transparent;

