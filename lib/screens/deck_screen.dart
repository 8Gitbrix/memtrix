import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';
import 'package:memtrix/widgets/note_card.dart';
import 'package:memtrix/widgets/round_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class DeckScreen extends StatefulWidget {
  static final id = 'deck_screen';

  DeckScreen({this.title, this.numCards});

  final String title;
  final int numCards;

  @override
  _DeckScreenState createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  String title;
  int numCards;
  int currentPage = 0;

  // if there's nothing to fetch from db, have empty starting note card:
  List<NoteCard> _cards = [NoteCard()];
  PageController controller = PageController(
    initialPage: 0,
    keepPage: false,
    viewportFraction: 0.9,
  );

  @override
  void initState() {
    super.initState();
    title = widget.title;
    numCards = widget.numCards;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Title',
          style: kTitleStyle,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              EvaIcons.arrowBack,
              color: kInfoCardColor,
            ),
            onPressed: () {
              Navigator.pop(
                context,
                DeckScreen(
                  title: title,
                  numCards: numCards,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return _buildCard(context, index);
                },
                itemCount: _cards.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundButton(
              icon: Icon(
                EvaIcons.minus,
                color: Colors.cyanAccent,
              ),
              onPressed: () {
                setState(() {
                  // make an alert!
                  _cards.removeAt(currentPage);
                });
              },
            ),
            RoundButton(
              icon: Icon(
                EvaIcons.heart,
                color: Colors.pinkAccent,
              ),
              onPressed: () {
                setState(() {
                  // make an alert!
                  //TODO: implement
                });
              },
            ),
            RoundButton(
              icon: Icon(
                EvaIcons.plus,
                color: Colors.yellowAccent,
              ),
              onPressed: () {
                setState(() {
                  _cards.add(NoteCard());
                  currentPage = _cards.length;
                });
                controller.jumpToPage(currentPage);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    final double bottom = index == currentPage ? 25 : 25;
    final double top = index == currentPage ? 10 : 30;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuint,
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: _cards[index],
    );
  }
}
