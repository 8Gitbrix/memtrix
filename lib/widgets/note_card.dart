import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:memtrix/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:memtrix/widgets/gif_card.dart';
import 'package:memtrix/widgets/reusable_card.dart';
import 'package:memtrix/widgets/reusable_txtfield.dart';

class NoteCard extends StatefulWidget {
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  // If there is no frontText to receive from db, frontText = '' empty string
  String frontText;
  double frontCardHeight = 700;
  double frontImgCardHeight = 0;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Stack(
        children: <Widget>[
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 300),
            top: 280,
            height: frontImgCardHeight,
            child: GifCard(),
          ),
          // FIGURE OUT A WAY TO ENABLE A SCROLL ANIMATION IN THE CARD!
          AnimatedContainer(
            height: frontCardHeight,
            curve: Curves.easeInOutQuad,
            duration: Duration(milliseconds: 330),
            child: ReusableCard(
              color: kInfoCardColor,
              childPadding: 30.0,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Expanded(
                    child: ReusableTxtField(frontText: ''),
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                frontCardHeight = frontCardHeight == 700 ? 280 : 700;
                frontImgCardHeight = frontImgCardHeight == 280 ? 0 : 280;
              });
            },
            tooltip: 'Insert a GIF',
            child: Icon(
              EvaIcons.image,
              color: kMainColor,
            ),
            backgroundColor: kPinkColor,
          ),
        ],
      ),
      back: Card(
        color: kInfoCardColor,
        elevation: 25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
