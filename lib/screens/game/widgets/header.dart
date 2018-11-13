import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('a'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('b'),
          ),
        ],
      ),
    );
  }
}
