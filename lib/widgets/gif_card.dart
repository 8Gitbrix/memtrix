import 'package:flutter/material.dart';
import 'gif_search.dart';
import '../constants.dart';
import 'reusable_card.dart';

class GifCard extends StatefulWidget {
  GifCard();
  @override
  _GifCardState createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  String gifButtonText = 'Add GIF';
  Image cardImage;
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
            cardImage == null ? Spacer() : Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(20.0), child: cardImage)),
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

  void onGIFPressed(BuildContext context) async {
    Image selected = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: Container(
            child: GifSearch(context: context),
          ),
        );
      },
    );
    setState(() {
      gifButtonText = cardImage == null ? 'Add GIF' : 'Change GIF' ;
      cardImage = selected;
    });
  }
}
