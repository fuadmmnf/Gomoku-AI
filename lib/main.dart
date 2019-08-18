import 'package:flutter/material.dart';

import 'pages/dashboard.dart';
import 'pages/gamepage.dart';
import 'utilies/board.dart';
void main() => runApp(MyApp());

//void main(){
//  var brd=new BoardClass();
//  brd.changeEntry(5, 6, 1);
//  brd.changeEntry(6, 7, 1);
//  brd.changeEntry(7, 8, 1);
//  brd.changeEntry(8, 9, 1);
//  brd.boardPrint();
//  if(brd.searchForMatch(4, 1))
//    print("Match Found");
//  else
//    print("No match found");
//
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => DashboardPage(),
        '/gamepage': (BuildContext context) => GamePage(),
      },
    );
  }
}

