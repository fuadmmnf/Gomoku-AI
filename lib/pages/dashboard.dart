import 'package:flutter/material.dart';

import 'package:gomoku_ai/widgets/customButton.dart';
import 'package:gomoku_ai/widgets/switchButton.dart';

class DashboardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        child: Align(
          alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                SimpleRoundButton(),
                SwitchButton(),
              ],
            )
        ),
      ),
    );
  }
}
