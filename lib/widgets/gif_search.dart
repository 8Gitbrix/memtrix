import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';
import 'package:memtrix/api_keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GifSearch extends StatefulWidget {
  @override
  _GifSearchState createState() => _GifSearchState();
}

class _GifSearchState extends State<GifSearch> {
  final _query = BehaviorSubject<String>();
  List<Image> gifs = [];
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
      final gifsDynamic = jsonsList.map((g) => Image.network(g['images']['original']['url'] as String)).toList();
      gifs = List<Image>.from(gifsDynamic);
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
                  : Expanded(child: GridView.count(
                      crossAxisCount: 2,
                      children: gifs,
                    )))
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
