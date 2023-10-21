import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  Reusable ({required this.colour, required this.childcard});
  final Color colour;
  final Widget childcard;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childcard,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: 170.0,
    );
  }
}