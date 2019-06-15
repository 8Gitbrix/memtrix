import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';
import 'package:memtrix/screens/login_screen.dart';
import 'package:memtrix/screens/notes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kMainColor,
        appBarTheme: kAppBarTheme,
      ),
      initialRoute: NotesScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        NotesScreen.id : (context) => NotesScreen(),
      },
    );
  }
}


