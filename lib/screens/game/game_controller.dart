import 'dart:async';
import 'package:flutter/widgets.dart';

class GameController {
  String answer;
  int _errorCount = 0;
  final int maxErrorCount = 7;
  String imagePath = 'assets/images/hangman_0.png';
  List<String> wrongLetters = List<String>();
  List<String> rightLetters;
  List<String> puzzleLetters = List<String>();

  StreamController<String> onSomething = StreamController();

  void takeShot(String letter) {
    if (!alreadyTried(letter)) {
      if (answer.toLowerCase().contains(letter.toLowerCase())) {
        _success(letter);
      } else {
        _error(letter);
      }
    }
  }

  void _error(String letter) {
    this._errorCount++;
    String tag = alreadyLost() ? '[lose]' : '[error]';
    this.updateImagePath();
    this.wrongLetters.add(letter);
    this.onSomething.add(tag);
  }

  void _success(String letter) {
    rightLetters.add(letter);
    updatePuzzle();
    String tag = puzzleLetters.contains(' ') ? '[success]' : '[win]';
    onSomething.add('$tag');
  }

  void updatePuzzle() {
    List<String> letters = List<String>();
    for (int i = 0; i < answerLength; i++) {
      rightLetters.contains(answer[i])
          ? letters.add(answer[i])
          : letters.add(' ');
    }

    puzzleLetters = letters;
  }

  void updateImagePath() {
    this.imagePath = alreadyLost()
        ? 'assets/images/hangman_lose.png'
        : alreadyWon() ? 'assets/images/hangman_win.png' : 'assets/images/hangman_$_errorCount.png';
  }

  bool alreadyWon() {
    return !puzzleLetters.contains(' ');
  }

  bool alreadyTried(String letter) {
    return wrongLetters.contains(letter) || wrongLetters.contains(letter);
  }

  bool alreadyLost() {
    return this._errorCount >= this.maxErrorCount;
  }

  int get answerLength => answer.length;

  GameController({@required this.answer}) {
    rightLetters = List<String>();
    updatePuzzle();
  }
}
