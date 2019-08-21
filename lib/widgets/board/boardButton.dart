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

  bool isSelected = false;
  int selectedPlayer = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width * .09,
        height: MediaQuery.of(context).size.width * .09,
//        margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        child: RaisedButton(
          elevation: 15.0,
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),

          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          splashColor: Colors.white10,
          color: isSelected? ((selectedPlayer == 1) ? Colors.black: Colors.white) : Colors.red[200],
          child: null,
          onPressed: () {
            setState(() {
              if(!isSelected){
                isSelected = !isSelected;
                selectedPlayer = widget._singleton.getCurrentPlayer();
                widget._singleton.changeCurrentPlayer();
              }

            });
          },
        ),
      ),
    );
  }
}
