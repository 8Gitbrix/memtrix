import 'package:flutter/material.dart';
import 'package:memtrix/widgets/note_card.dart';

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
  int currentPage = 0;
  
  // if there's nothing to fetch from db, have empty starting note card:
  List<NoteCard>_cards = [NoteCard()];
  PageController controller;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    numCards = widget.numCards;
    controller = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 0.5,
    );
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
        title: Text('title'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
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
            Card(
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.cyanAccent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.star),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // screen should also move to the last card!!
                        setState(() {
                          _cards.add(NoteCard());
                          currentPage = _cards.length;
                          
                        });
                        controller.jumpToPage(currentPage);
                      },
                    ),
                    Icon(Icons.edit),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          // make an alert!
                          _cards.removeAt(currentPage);
                        });
                      },
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 14),
          ],
        )
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    final double blur = index == currentPage ? 10 : 0;
    final double offset = index == currentPage ? 20 : 0;
    final double top = index == currentPage ? 50 : 150;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50),
      child: _cards[index],
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

}

