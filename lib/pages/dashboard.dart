import 'package:flutter/material.dart';

import 'package:gomoku_ai/widgets/customRaisedButton.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[400],
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[

                        new Container(
                          child: new Image.asset(
                            'asset/images/logo.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Center(
                          child: Text(
                            "Gomoku",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5.0,
                                fontSize: 40.0,
                                fontFamily: "JosefinSans"

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child:  Container(
                            child:  Image.asset(
                              'asset/images/robot.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(children: <Widget>[
                      SimpleRoundButton(
                        textColor: Colors.white,
                        backgroundColor: Colors.orangeAccent,
                        buttonText: "Play",
                        onPressed: (){
                          Navigator.of(context).pushNamed('/gamepage');
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 200,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          splashColor: Colors.red[400],
                          color: Colors.red[400],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Padding(
                                padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                child: Text(
                                  'Leaderboard',
                                  style: TextStyle(
                                      letterSpacing: 3.0,
                                      fontSize: 14.0,
                                      color: Colors.white70,
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
                    ])),
              ],
            )));
  }
}
