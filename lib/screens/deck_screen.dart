import 'package:flutter/material.dart';

class DeckScreen extends StatefulWidget {
  static final id = 'note_screen';

  DeckScreen({this.title, this.numCards});

  final String title;
  final int numCards;

  @override
  _DeckScreenState createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  String title;
  int numCards;

  @override
  void initState() {
    super.initState();

    title = widget.title;
    numCards = widget.numCards;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, DeckScreen(title: title, numCards: numCards,));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}