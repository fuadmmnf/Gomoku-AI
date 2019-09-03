import 'package:flutter/material.dart';

import 'package:gomoku_ai/widgets/switcher/barItem.dart';
import 'package:gomoku_ai/widgets/customDialog.dart';
import 'package:gomoku_ai/utils/singleton.dart';
import 'package:gomoku_ai/utils/minimax.dart';

class GamePage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: "Human", iconData: Icons.face, color: Colors.blueAccent),
    BarItem(text: "AI", iconData: Icons.android, color: Colors.lightGreen[400]),
  ];

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  final Singleton _singleton = Singleton();
  int selectedPlayer;
  int previousMove = -1;

  @override
  void initState() {
    _singleton.clearBoard();
    selectedPlayer = _singleton.getCurrentPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "Gomoku_AI",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, top: 8.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildBarItems(),
//                  children: null,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .95,
              height: MediaQuery.of(context).size.height * .56,
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 20.0,
                              spreadRadius: 5.0,
                              offset: Offset(10.0, 20.0))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (var i = 0; i < 10; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (var j = 0; j < 10; j++)
                                Container(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .09,
                                    height:
                                        MediaQuery.of(context).size.width * .09,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 2.0),
                                    child: RaisedButton(
                                      elevation: 15.0,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 2.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      splashColor: Colors.white10,
                                      color: (previousMove == i * 10 + j)
                                          ? (_singleton
                                                      .getBoard()
                                                      .getPlayer(i, j) !=
                                                  -1
                                              ? ((_singleton
                                                          .getBoard()
                                                          .getPlayer(i, j) ==
                                                      1)
                                                  ? Colors.black
                                                  : Colors.white)
                                              : Colors.red[200])
                                          : (_singleton
                                                          .getBoard()
                                                          .getPlayer(i, j) !=
                                                      -1
                                                  ? ((_singleton
                                                              .getBoard()
                                                              .getPlayer(
                                                                  i, j) ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.white)
                                                  : Colors.red[200])
                                              .withOpacity(0.70),
                                      child: null,
                                      onPressed: () {
                                        if(_singleton.getCurrentPlayer() == 1)
                                          placeMove(i, j);
                                      },
                                    ),
                                  ),
                                )
                            ],
                          )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                splashColor: Colors.red[300],
                color: Colors.red[300],
                child: Icon(
                  Icons.replay,
                  color: Colors.red[100],
                ),
                onPressed: () {
                  _singleton.clearBoard();
                  selectedPlayer = _singleton.getCurrentPlayer();
                  _singleton.getBoard().isGameOver = false;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();

    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool currentSelected = selectedPlayer == i + 1;
      //      print(widget._singleton.getCurrentPlayer());

      _barItems.add(InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(microseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: currentSelected
                ? item.color.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                item.iconData,
                color: currentSelected == true ? item.color : Colors.black,
                size: 28.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              AnimatedSize(
                vsync: this,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Text(
                  currentSelected ? item.text : "",
                  style: TextStyle(
                    color: item.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return _barItems;
  }

  void displayDialogIfGameOver() {
    if (_singleton.getBoard().searchForMatch(5, selectedPlayer) > 0) {
      _singleton.getBoard().isGameOver = true;

      Future.delayed(
          Duration.zero,
          () => showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(
                  message: ((selectedPlayer == 1) ? "You" : "AI") + " won",
                  imageName: (selectedPlayer == 1)
                      ? "asset/images/smile.png"
                      : "asset/images/ai.png")));
    }

    if (_singleton.getBoard().isBoardFinished()) {
      _singleton.getBoard().isGameOver = true;

      Future.delayed(
          Duration.zero,
          () => showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(
                  message: "Draw", imageName: "asset/images/smile.png")));
    }
  }

  placeMove(int i, int j) async {
    print(i.toString()+"_"+j.toString());
    if (!_singleton.getBoard().isGameOver) {
      if (_singleton.getBoard().getPlayer(i, j) == -1) {
        _singleton.getBoard().changeEntry(i, j, selectedPlayer);
        setState(() {});
        displayDialogIfGameOver();

        previousMove = i * 10 + j;

        if (!_singleton.getBoard().isGameOver) {
          _singleton.changeCurrentPlayer();

          setState(() {
            selectedPlayer = _singleton.getCurrentPlayer();
          });
          await Future.delayed(const Duration(milliseconds: 450));

          await moveAI();
          if (!_singleton.getBoard().isGameOver) {
//            previousMove = aiMove;
            _singleton.changeCurrentPlayer();


            setState(() {
              selectedPlayer = _singleton.getCurrentPlayer();
            });
          }
        }
      }
    }
  }

  Future moveAI() {
    Minimax minimax = Minimax();

    int best_moves = minimax.generateBestMove(_singleton.getBoard());

    _singleton.getBoard().changeEntry(
        (best_moves / 10).toInt(), best_moves % 10, selectedPlayer);
    previousMove = best_moves;
    setState(() {});

    displayDialogIfGameOver();
//    return best_moves;
  }
}
