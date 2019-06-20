import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';
import 'package:memtrix/widgets/deck_info.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class DecksScreen extends StatefulWidget {
  static final id = 'decks_screen';

  @override
  _DecksScreenState createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  List<DeckInfo> infoCards = [DeckInfo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decks', style: kTitleStyle),
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.arrowBack, color: kInfoCardColor,),
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
