import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String> wrongLetters;

  Header({@required this.wrongLetters});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      height: 35.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            wrongLetters.length > 0 ? wrongLetters.length + 1 : 1, (int index) {
          if (index != 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                wrongLetters[index - 1],
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
              child: Text('Erros: ', textAlign: TextAlign.center,),
            );
          }
        }),
      ),
    );
  }
}
