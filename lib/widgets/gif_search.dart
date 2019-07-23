import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';
import 'package:memtrix/api_keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GifSearch extends StatefulWidget {
  // use the model sheet's context to programatically exit it
  GifSearch({this.context});
  BuildContext context;
  @override
  _GifSearchState createState() => _GifSearchState();
}

class _GifSearchState extends State<GifSearch> {
  final _query = BehaviorSubject<String>();
  List<String> gifs = []; // list of gif urls
  String apiKey = xGiphy_key;
  bool hasLoaded = true;
  bool searchError = false;

  @override
  void initState() {
    super.initState();
    _query.stream
        .debounce((_) => TimerStream(true, Duration(milliseconds: 500)))
        .listen(onData);
  }

  @override
  void dispose() {
    _query.close();
    super.dispose();
  }

  void onData(String query) async {
    setState(() {
      hasLoaded = false;
      searchError = false;
    });

    Response response = await get(
        'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query');

    if (response.statusCode == 200) {
      String data = response.body;
      var jsonsList = jsonDecode(data)['data'];
      final gifsDynamic = jsonsList
          .map((g) => g['images']['original']['url'] as String)
          .toList();
      gifs = List<String>.from(gifsDynamic);
      setState(() {
        hasLoaded = true;
        searchError = false;
      });
    } else {
      setState(() {
        hasLoaded = true;
        searchError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  onSubmitted: (String input) => (_query.add(input)),
                ),
              ),
            ),
          ),
          // GRID VIEW: ___________________________________________________
          hasLoaded
              ? (searchError
                  ? Text('Sry, no GIFS found. Try a different search!')
                  : Expanded(
                      child: StaggeredGridView.countBuilder(
                        itemCount: gifs.length == 0 ? 0 : 25,
                        crossAxisCount: 4,
                        itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                            child: Image.network(gifs[index]),
                            onTap: () {
                              // close the parent modal sheet and return the gif:
                              Navigator.pop(widget.context, Image.network(gifs[index]));
                            },
                          ),
                        staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
                      ),
                    ))
              : CircularProgressIndicator()
        ],
      ),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
