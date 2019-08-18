import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  var player = false;

  void changePlayer(bool value){
    setState(() {
      player = value;
    });
  }

@override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: true,
      onChanged: changePlayer,
      activeColor: Colors.deepOrange,
      secondary: new Icon(Icons.directions_bus),
      title: new Text('Hi how are you',style: new TextStyle(fontSize: 23.0),),
      subtitle: new Text('Hi subtitle how are you'),
    );
  }
}
