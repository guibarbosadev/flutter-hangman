import 'package:flutter/material.dart';
import 'package:hangman/screens/new-game/new_game.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewGame(),
    theme: ThemeData(
      primaryColor: Colors.brown,
      accentColor: Colors.black
    )
  ));
}