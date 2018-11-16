import 'package:flutter/material.dart';
import 'package:hangman/screens/game/widgets/header.dart';
import 'package:hangman/screens/game/widgets/puzzle.dart';
import 'game_controller.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  GameController gameController;
  String letter;
  Header _header;
  Puzzle _puzzle;

  @override
  void initState() {
    gameController = GameController(answer: 'banana', maxErrorCount: 7);
    _header = Header(wrongLetters: []);
    _puzzle = Puzzle(
      answerLength: gameController.answerLength,
      puzzleLetters: gameController.puzzleLetters,
    );
    gameController.onSomething.stream.listen((String data) {
      dealWithGameEvents(data);
    });
    super.initState();
  }

  dealWithGameEvents(String event) {
    setState(() {
      gameController.updateImagePath();
      _puzzle = Puzzle(
        answerLength: gameController.answerLength,
        puzzleLetters: gameController.puzzleLetters,
      );
    });
  }

  _limitTextToOne(String value) {
    setState(() {
      if (value.length > 1) {
        letter = value.substring(1, 2);
      } else {
        letter = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget title = Text(
      'Jogo da Forca',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black),
    );

    final Widget submitButton = ButtonTheme(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      minWidth: 20.0,
      child: OutlineButton(
        onPressed: () {
          gameController.takeShot(letter);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Icon(Icons.done),
      ),
    );

    final Widget newGameButton = RaisedButton(
      onPressed: () => {
        //TODO: Generate a new game and reset the current one
      },
      child: Text('Novo Jogo'),
    );

    final Widget textField = Container(
      width: 150.0,
      child: TextField(
        controller: TextEditingController(text: letter),
        onChanged: (String value) {
          _limitTextToOne(value);
        },
        decoration: InputDecoration(
          labelText: 'Próxima Letra',
          enabledBorder: InputBorder.none,
        ),
      ),
    );

    final answeredPuzzle = Puzzle(
      answerLength: gameController.answerLength,
      puzzleLetters: gameController.answer.split(''),
    );

    return Scaffold(
      body: Container(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: ListView(
            children: [
              _header,
              title,
              Center(child: Image.asset('${gameController.imagePath}')),
              gameController.alreadyLost()
                  ? Column(
                      children: <Widget>[
                        Text('Resposta',
                            style: Theme.of(context).textTheme.subhead),
                        answeredPuzzle,
                      ],
                    )
                  : _puzzle,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: gameController.alreadyWon()
                    ? <Widget>[newGameButton]
                    : gameController.alreadyLost()
                        ? <Widget>[newGameButton]
                        : <Widget>[
                            textField,
                            submitButton,
                          ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
