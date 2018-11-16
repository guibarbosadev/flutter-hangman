import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String> wrongLetters;

  Header({@required this.wrongLetters});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      height: 25.0,
      child: Row(
        children: List.generate(wrongLetters.length, (int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              wrongLetters[index],
              style: TextStyle(
                fontSize: 25.0,
                decoration: TextDecoration.underline,
              ),
            ),
          );
        }),
      ),
    );
  }
}
