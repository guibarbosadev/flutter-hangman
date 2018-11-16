import 'package:flutter/material.dart';

class NewGame extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.black12,
        highlightColor: Colors.black12,
        onTap: () {
          if (_focusNode.hasFocus) {
            _focusNode.unfocus();
            print('dentro do if');
          } else {
            print('caindo no else');
          }
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Palavra da vez: '),
                Container(
                  child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                      textAlign: TextAlign.center,
                      focusNode: _focusNode),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
