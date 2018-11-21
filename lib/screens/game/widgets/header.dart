import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String> wrongLetters;

  Header({@required this.wrongLetters});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[200],
      height: 35.0,
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            wrongLetters.length > 0 ? wrongLetters.length + 1 : 1, (int index) {
          if (index != 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                wrongLetters[index - 1],
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                    ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
              child: Text('Erros: ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold)),
            );
          }
        }),
      ),
    );
  }
}
