import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';
import 'package:memtrix/screens/deck_screen.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatefulWidget {
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  String title = 'untitled';
  String dateAccessed = DateFormat('yyyy-MM-dd').format(DateTime.now());
  int numCards = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DeckScreen deckScreen = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeckScreen(title: title, numCards: numCards),
          ),
        );

        setState(() {
          title = deckScreen.title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: kInfoCardColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, style: kInfoCardTitleStyle,),
              SizedBox(height: 30),
              Text(dateAccessed, style: kInfoCardDateStyle),
              SizedBox(height: 30),
              Text('${numCards.toString()} cards'),
            ],
          ),
        ),
      ),
    );
  }
}