import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.color, this.childPadding, this.cardChild});

  final Color color;
  final double childPadding;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(childPadding),
        child: cardChild,
      ),
    );
  }
}
