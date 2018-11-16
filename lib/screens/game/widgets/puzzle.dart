import 'package:flutter/material.dart';

class Puzzle extends StatelessWidget {

  final List<String> puzzleLetters;
  final int answerLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(answerLength, (int index) {
        return Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            puzzleLetters[index],
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        );
      })
    );
  }

  Puzzle({@required this.puzzleLetters, @required this.answerLength});
}