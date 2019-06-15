import 'package:flutter/material.dart';
import 'package:memtrix/widgets/info_card.dart';

class NotesScreen extends StatefulWidget {
  static final id = 'notes_screen';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<InfoCard> infoCards = [InfoCard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decks'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: infoCards,
          ),
        ),
      ),
    );
  }
}
