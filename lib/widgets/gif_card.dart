import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'reusable_card.dart';

class GifCard extends StatefulWidget {
  GifCard();
  @override
  _GifCardState createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  String gifButtonText = 'Add GIF';
  //Future getImage()
  // upload from camera, gallery or search on pixabay!

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kPinkColor,
      childPadding: 10,
      cardChild: Container(
        width: 340,
        child: Column(
          children: <Widget>[
            Spacer(),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: kMainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(gifButtonText),
                  textColor: Colors.cyanAccent,
                  onPressed: () => onGIFPressed(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onGIFPressed(BuildContext context) {
    setState(() {
      gifButtonText = gifButtonText == 'Add GIF' ? 'Change GIF' : 'Add GIF';
    });
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: Container(
            child: Column(
              children: <Widget>[
                // SEARCH BAR:
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 17,
                          color: kMainColor,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search_',
                          hintStyle: TextStyle(color: kMainColor),
                          icon: Icon(
                            EvaIcons.search,
                            color: Colors.pinkAccent,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // GRID VIEW

              ],
            ),
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        );
      },
    );
  }
}
