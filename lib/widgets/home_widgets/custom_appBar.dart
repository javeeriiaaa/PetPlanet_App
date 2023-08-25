import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_planet/utils/quotes.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  //const CustomAppBar({Key? key}) : super(key: key);
  Function? onTap;
  int? quoteIndex;
  CustomAppBar({this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        child: Text(
            sweetSayings[quoteIndex!],
          style: TextStyle(
            fontSize: 22,
            color: Colors.teal.shade900,
          ),
        ),
      ),
    );
  }
}
