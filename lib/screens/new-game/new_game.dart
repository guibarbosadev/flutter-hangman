import 'package:flutter/material.dart';
import 'package:hangman/screens/game/game.dart';

class NewGame extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void startNewGame(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Game(answer: _textEditingController.text),
      ),
      (Route<dynamic> route) => false
    );
  }

  void _toggleFocus(BuildContext context) {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    } else {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Text(
        'Palavra da vez: ',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Container(
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(border: InputBorder.none),
        autofocus: true,
        style: Theme.of(context).textTheme.title.copyWith(fontSize: 35.0),
        textAlign: TextAlign.center,
        focusNode: _focusNode,
      ),
    );
  }

  Widget _buildNewGameButton(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          onPressed: () {
            startNewGame(context);
          },
          child: Text('Novo jogo'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.brown[100],
        highlightColor: Colors.brown[100],
        onTap: () {
          _toggleFocus(context);
        },
        child: Container(
          color: Colors.brown[200],
          padding: EdgeInsets.only(
            top: 20.0,
            right: 20.0,
            bottom: 140.0,
            left: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildTitle(context),
              _buildTextField(context),
              _buildNewGameButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
