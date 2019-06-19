import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';

class RoundButton extends StatelessWidget {

  RoundButton({this.icon, this.onPressed});

  final Icon icon;
  
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 20,
      child: icon,
      shape: CircleBorder(),
      fillColor: kMainColor,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
    );
  }
}