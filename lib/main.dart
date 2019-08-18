import 'package:flutter/material.dart';

import 'pages/dashboard.dart';
import 'pages/gamepage.dart';

void main() => runApp(MyApp());

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

