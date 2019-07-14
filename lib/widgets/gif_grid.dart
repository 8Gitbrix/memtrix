import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GifGrid extends StatefulWidget {
  @override

  _GifGridState createState() => _GifGridState();
}

class _GifGridState extends State<GifGrid> {
  List<Image> gifs = [];
  String query;
  String apiKey = 'YOUR API KEY';

  @override
  void initState() {
    super.initState();

  }

  void getData() async {
    Response response = await get('https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query');

    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      print(jsonData);
    } else {   
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}