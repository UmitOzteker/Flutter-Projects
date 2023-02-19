import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';

class MyColumn extends StatelessWidget {
  final IconData? ikon;
  final String? mesaj;
  MyColumn(
      {this.ikon = FontAwesomeIcons.arrowPointer, this.mesaj = "Belirsiz"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ikon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          mesaj!,
          style: kMetinStili
        ),
      ],
    );
  }
}
