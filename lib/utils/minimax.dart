import 'dart:math';
import 'board.dart';

class Minimax {
  final infinite = 9000000000.0;
  final int AI = 2;
  final int HUMAN = 1;

  int bestMove = -1,
      initMove = -1;

  final maxDepth = 3;
//  var dX = [0, 0, 1, -1, 1, -1, 1, -1, 0, 0, 2, -2, 2, -2, 2, -2,];
//  var dY = [1, -1, 0, 0, 1, -1, -1, 1, 2, -2, 0, 0, 2, -2, -2, 2,];

  var dX = [0, 0, 1, -1, 1, -1, 1, -1,];
  var dY = [1, -1, 0, 0, 1, -1, -1, 1,];

  int generateBestMove(BoardClass board) {
    double bestVal = minimax(board, 0, AI, -infinite, infinite);
    print("bestVAl: "+bestVal.toString());
    return bestMove == -1 ? initMove : bestMove;
  }

  double minimax(BoardClass board, int depth, int currentPlayer, double alpha,
      double beta) {
    int alternatePlayer = (currentPlayer == AI) ? HUMAN : AI;

    if (board.searchForMatch(5, alternatePlayer) > 0) {
      print(alternatePlayer);
      if (alternatePlayer == AI)
        return infinite - depth.toDouble();
      else
        return -infinite + depth.toDouble();
    }

    if (depth > maxDepth)
      return cutOffEvaluation(board, alternatePlayer);

    double bestVal;
    List<BoardClass> blankTiles = [];
    List<int> changeList = [];
    List<bool> isExpanded = List(100);


    for (int i = 0; i < 100; i++) {
      isExpanded[i] = false;
    }

    if (currentPlayer == AI) {
      bestVal = -infinite;

      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
          if (board.getPlayer(i, j) != -1) {
            for (int it = 0; it < 8; it++) {
              if ((i + dX[it] >= 0 && i + dX[it] < 10) &&
                  (j + dY[it] >= 0 && j + dY[it] < 10)) if (board.getPlayer(
                  i + dX[it], j + dY[it]) ==
                  -1) {
                if (isExpanded[(i + dX[it]) * 10 + j + dY[it]] == false) {
                  isExpanded[(i + dX[it]) * 10 + j + dY[it]] = true;

                  BoardClass tempBoard = board.copyBoard();
                  tempBoard.changeEntry(i + dX[it], j + dY[it], currentPlayer);
//                  if (depth == 0) initMove = (i + dX[it]) * 10 + j + dY[it];
                  bestVal = max(bestVal,
                      minimax(tempBoard, depth + 1, HUMAN, alpha, beta));
                  if (bestVal > alpha) {
                    alpha = bestVal;
                    bestMove = (i + dX[it]) * 10 + j + dY[it];
                  }

                  if (beta <= alpha) return bestVal;
                }
              }
            }
//            if (beta <= alpha) break;
          }
        }
//        if (beta <= alpha) break;
      }
    } else {
      bestVal = infinite;
      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
          if (board.getPlayer(i, j) != -1) {
            for (int it = 0; it < 8; it++) {
              if ((i + dX[it] >= 0 && i + dX[it] < 10) &&
                  (j + dY[it] >= 0 && j + dY[it] < 10)) if (board.getPlayer(
                  i + dX[it], j + dY[it]) ==
                  -1) {
                if (isExpanded[(i + dX[it]) * 10 + j + dY[it]] == false) {
                  isExpanded[(i + dX[it]) * 10 + j + dY[it]] = true;


                  BoardClass tempBoard = board.copyBoard();
                  tempBoard.changeEntry(i + dX[it], j + dY[it], currentPlayer);
                  bestVal = min(
                      bestVal, minimax(tempBoard, depth + 1, AI, alpha, beta));
                  beta = min(beta, bestVal);
                  if (beta <= alpha) return bestVal;
                }
              }
//              if (beta <= alpha) break;
            }
          }
        }
//        if (beta <= alpha) break;
      }
    }
    return bestVal;
  }

  double cutOffEvaluation(BoardClass board, int currentPlayer ) {
    double value = 0;
    int alternatePlayer = (currentPlayer == AI) ? HUMAN : AI;
    int sign = (currentPlayer == AI) ? 1 : -1;
//

//    value += 100000*board.searchForLooseEnds(4, 2, AI);
//    value += 300*board.searchForLooseEnds(4, 1, AI);
//    value += 500*board.searchForLooseEnds(3, 2, AI);
//    value += 50*board.searchForLooseEnds(3, 1, AI);
//    value += 10*board.searchForLooseEnds(2, 2, AI);
//    value += 5*board.searchForLooseEnds(2, 1, AI);
//
//
//    value -= 100100*board.searchForLooseEnds(4, 2, HUMAN);
//    value -= 350*board.searchForLooseEnds(4, 1, HUMAN);
//    value -= 510*board.searchForLooseEnds(3, 2, HUMAN);
//    value -= 53*board.searchForLooseEnds(3, 1, HUMAN);
//    value -= 15*board.searchForLooseEnds(2, 2, HUMAN);
//    value -= 6*board.searchForLooseEnds(2, 1, HUMAN);
//



    if (board.searchForLooseEnds(4, 2, currentPlayer) > 0) {
      return sign*100000000.0;
    }
    if (board.searchForLooseEnds(4, 2, alternatePlayer) > 0) {

      return -sign*500000.0;
    }

    if (board.searchForLooseEnds(4, 1, currentPlayer) > 0) {
      return sign*100000000.0;
    }
    if (board.searchForLooseEnds(4, 1, alternatePlayer) > 0) {

      return -sign*50.0;
    }



    if (board.searchForLooseEnds(3, 2, currentPlayer) > 0) {
      return sign*10000.0;
    }
    if (board.searchForLooseEnds(3, 2, alternatePlayer) > 0) {
      return -sign*50.0;
    }

    if (board.searchForLooseEnds(3, 1, currentPlayer) > 0) {
      return sign*7.0;
    }
    if (board.searchForLooseEnds(3, 1, alternatePlayer) > 0) {

      return -sign*5.0;
    }

    if (board.searchForLooseEnds(2, 2, currentPlayer) > 0) {
      return sign*5.0;
    }
    if (board.searchForLooseEnds(2, 2, alternatePlayer) > 0) {

      return -sign*5.0;
    }


    if (board.searchForLooseEnds(2, 1, currentPlayer) > 0) {
      return sign*2.0;
    }
    if (board.searchForLooseEnds(2, 1, alternatePlayer) > 0) {

      return -sign*2.0;
    }



    if (board.searchForLooseEnds(1, 2, currentPlayer) > 0) {
      return sign*1.0;
    }
    if (board.searchForLooseEnds(1, 2, alternatePlayer) > 0) {

      return -sign*1.0;
    }

    if (board.searchForLooseEnds(1, 1, currentPlayer) > 0) {
      return sign*.5;
    }
    if (board.searchForLooseEnds(1, 1, alternatePlayer) > 0) {

      return -sign*.5;
    }



    return 200000000;
  }
}
