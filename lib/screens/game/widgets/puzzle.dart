import 'package:flutter/material.dart';

class Puzzle extends StatelessWidget {

  final List<String> puzzleLetters;
  final int answerLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: List.generate(answerLength, (int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              puzzleLetters[index],
              style: TextStyle(decoration: TextDecoration.underline, fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          );
        })
      ),
    );
  }

  Puzzle({@required this.puzzleLetters, @required this.answerLength});
}