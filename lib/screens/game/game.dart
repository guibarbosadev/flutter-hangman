import 'package:flutter/material.dart';
import 'package:hangman/screens/game/widgets/header.dart';
import 'package:hangman/screens/game/widgets/puzzle.dart';
import 'game_controller.dart';
import 'package:hangman/screens/new-game/new_game.dart';

class Game extends StatefulWidget {
  final String answer;

  @override
  _GameState createState() => _GameState();

  Game({@required this.answer});
}

class _GameState extends State<Game> {
  GameController gameController;
  String letter;
  Header _header;
  Puzzle _puzzle;

  @override
  void initState() {
    gameController = GameController(answer: widget.answer);
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
      _header = Header(
        wrongLetters: gameController.wrongLetters,
      );
    });
  }

  _limitTextToOne(String value) {
    setState(() {
      if (value.length > 1) {
        letter = value[value.length - 1];
      } else {
        letter = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget _title = Text(
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
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NewGame(),
            ),
            (Route<dynamic> route) => false);
      },
      child: Text('Novo Jogo'),
    );

    Widget _buildTextField(BuildContext context) {
      return Container(
        width: 230.0,
        child: TextField(
          controller: TextEditingController(text: letter),
          onChanged: (String value) {
            _limitTextToOne(value);
          },
          style: Theme.of(context).textTheme.title.copyWith(fontSize: 35.0),
          decoration: InputDecoration(
            labelText: 'Próxima Letra',
            border: InputBorder.none,
          ),
        ),
      );
    }

    final answeredPuzzle = Puzzle(
      answerLength: gameController.answerLength,
      puzzleLetters: gameController.answer.split(''),
    );

    Widget _buildPuzzle(bool alreadyLost) {
      if (alreadyLost) {
        return Column(
          children: <Widget>[
            Text(
              'Resposta',
              style: Theme.of(context).textTheme.subhead,
            ),
            answeredPuzzle,
          ],
        );
      } else {
        return _puzzle;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.brown[200],
        child: ListView(
          children: [
            _header,
            _title,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                '${gameController.imagePath}',
                width: double.infinity,
                height: 350.0,
              ),
            ),
            _buildPuzzle(gameController.alreadyLost()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: gameController.alreadyWon()
                  ? <Widget>[newGameButton]
                  : gameController.alreadyLost()
                      ? <Widget>[newGameButton]
                      : <Widget>[
                          _buildTextField(context),
                          submitButton,
                        ],
            )
          ],
        ),
      ),
    );
  }
}
