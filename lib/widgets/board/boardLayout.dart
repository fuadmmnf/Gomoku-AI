import 'package:flutter/material.dart';

import 'boardButton.dart';

class BoardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(10.0, 20.0)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var i = 0; i < 10; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var j = 0; j < 10; j++)
                  BoardButton(
                    id: "i_j",
                    label: "x",
                  )
              ],
            )
        ],
      ),
    );
  }
}
