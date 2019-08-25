import 'board.dart';

class Singleton {
  static final Singleton _singleton = new Singleton._internal();

  static BoardClass board = BoardClass();
  static final int HUMAN = 1;
  static final int AI = 2;

  static int currentPlayer = 1;


  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  BoardClass getBoard(){
    return board;
  }

  void clearBoard(){
    board = BoardClass();
    currentPlayer = 1;
  }

  int getCurrentPlayer(){
    return currentPlayer;
  }


  void changeCurrentPlayer(){
    currentPlayer = (currentPlayer == 1)? 2: 1;
  }


}