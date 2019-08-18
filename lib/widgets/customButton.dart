import 'package:flutter/material.dart';

class SimpleRoundButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        width: 300,
        child: RaisedButton(
          elevation: 20.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          splashColor: Colors.orangeAccent,
          color: Colors.orangeAccent,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  'Play',
                  style: TextStyle(
                    letterSpacing: 5.0,
                    fontSize: 18.0,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            print("aitase");
          },
        ),
      ),
    );
  }
}
