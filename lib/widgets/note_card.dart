import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:memtrix/constants.dart';

class NoteCard extends StatefulWidget {
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  Image frontImage;
  String frontText;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Card(
        color: kInfoCardColor,
        elevation: 25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              // FIGURE OUT A WAY TO ENABLE A SCROLL ANIMATION IN THE CARD!
              Expanded(
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: kMainColor, width: 2),
                    // ),
                    
                    hintText: frontText != null ? frontText : 'Enter text ',
                    hintStyle: TextStyle(color: kMainColor)
                  ),
                  style: TextStyle(
                    fontSize: 24,
                    color: kMainColor,
                  ),
                  onChanged: (input) {
                    setState(() {
                      frontText = input;
                    });
                  },
                ),
              ),
              //GestureDetector(),
            ],
          ),
        )
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

