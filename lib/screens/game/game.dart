import 'package:flutter/material.dart';
import 'package:hangman/screens/game/widgets/header.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  String letter;

  _limitTextToOne(String value) {
    setState(() {
      if (value.length > 1) {
        letter = value.substring(0, 1);
      } else {
        letter = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: ListView(children: [
            Header(),
            Text(
              'Jogo da Forca',
              textAlign: TextAlign.center,
            ),
            Center(child: Image.asset('assets/images/hangman.png')),
            Center(
              child: Container(
                width: 150.0,
                child: TextField(
                  controller: TextEditingController(
                    text: letter
                  ),
                  onChanged: (String value) {
                    _limitTextToOne(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Próxima Letra',
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ,
        tooltip: 'Inserir nova letra',
        child: Icon(Icons.done),
      ),
    );
  }
}
