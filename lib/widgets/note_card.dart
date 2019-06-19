import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

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
        color: Colors.black38,
        elevation: 25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
                    border: OutlineInputBorder(),
                    hintText: frontText != null ? frontText : 'Enter text',
                  ),
                  style: TextStyle(
                    fontSize: 25,
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
        color: Colors.cyan,
        elevation: 25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

