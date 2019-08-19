import 'package:flutter/material.dart';

import 'package:gomoku_ai/widgets/board/boardLayout.dart';
import 'package:gomoku_ai/widgets/switcher/barItem.dart';
import 'package:gomoku_ai/widgets/switcher/animatedSwitcher.dart';
import 'package:gomoku_ai/utils/singleton.dart';

class GamePage extends StatelessWidget {
  final List<BarItem> barItems = [
    BarItem(text: "Human", iconData: Icons.face, color: Colors.blueAccent),
    BarItem(text: "AI", iconData: Icons.android, color: Colors.lightGreen[400]),
  ];

  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
//        appBar: AppBar(
//          centerTitle: true,
//          automaticallyImplyLeading: false,
//          backgroundColor: Colors.red[300],
//          title: Text(
//            "Gomoku_AI",
//            style: TextStyle(
//              fontSize: 18.0,
//              color: Colors.white70,
//            ),
//          ),
//        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
//            Text(
//              "Gomoku",
//              style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.bold,
//                  letterSpacing: 5.0,
//                  fontSize: 40.0,
//                  fontFamily: "JosefinSans"
//
//              ),
//            ),
//        Row(
//        mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            SizedBox(width: 20.0, height: 100.0),
//            Text(
//              "JUST",
//              style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.bold,
//                  letterSpacing: 5.0,
//                  fontSize: 24.0,
//                  fontFamily: "JosefinSans"
//
//              ),
//            ),
//            SizedBox(width: 20.0, height: 100.0),
//            RotateAnimatedTextKit(
//                onTap: () {
//                  print("Tap Event");
//                },
//                text: ["SEARCH", "PRUNE", "OPTIMIZE"],
//                textStyle: TextStyle(
//                    color: Colors.amber,
//                    fontWeight: FontWeight.bold,
//                    letterSpacing: 5.0,
//                    fontSize: 40.0,
//                    fontFamily: "JosefinSans"
//
//                ),
//                textAlign: TextAlign.start,
//                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
//            ),
//          ],
//        ),
            AnimatedBar(
              barItems: barItems,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .95,
              height: MediaQuery.of(context).size.height * .55,
              child: Align(alignment: Alignment.center, child: BoardLayout()),
            ),
          ],
        ),
      ),
    );
  }
}
