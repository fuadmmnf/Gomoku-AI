import 'package:flutter/material.dart';

class BoardButton extends StatefulWidget {
  String label;
  final id;

  BoardButton({this.id, this.label});

  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {

  bool isSelected = false;

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
          color: isSelected? Colors.black : Colors.white70,
          child: null,
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
      ),
    );
  }
}
