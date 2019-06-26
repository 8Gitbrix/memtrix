import 'package:flutter/material.dart';

const kMainColor = Color(0xFF282B30);

const kInfoCardTitleStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  color: kMainColor,
);

const kTitleStyle = TextStyle(
  color: kInfoCardColor,
  fontWeight: FontWeight.w300,
  fontSize: 40.0,
);

const kInfoCardDateStyle = TextStyle(
  fontSize: 17.0,
  color: kMainColor,
);

const kAppBarTheme = AppBarTheme(
  color: kMainColor,
  textTheme:
      TextTheme(title: TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
  elevation: 0.0,
);

const kInfoCardColor = Color(0xFF83FFDE);

const kPinkColor = Color(0xFFFAD2E3);

const kChooseImageText = Center(
  child: Text(
    'Choose an image',
    style: TextStyle(
      fontSize: 20,
      color: kMainColor,
    ),
  ),
);
