import 'package:flutter/material.dart';

import 'package:gomoku_ai/utils/singleton.dart';

class BoardButton extends StatefulWidget {
  String label;
  final id;

  final Singleton _singleton = Singleton();

  BoardButton({this.id, this.label});

  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {


  @override
  Widget build(BuildContext context) {

  }
}
