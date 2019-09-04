import 'dart:math';
import 'board.dart';

class Minimax {
  final infinite = 100000000;
  final int AI = 2;
  final int HUMAN = 1;

  int bestMove = -1,
      initMove = -1;

  final maxDepth = 3;
  var dX = [0, 0, 1, -1, 1, -1, 1, -1, 0, 0, 2, -2, 2, -2, 2, -2,];
  var dY = [1, -1, 0, 0, 1, -1, -1, 1, 2, -2, 0, 0, 2, -2, -2, 2,];

  int generateBestMove(BoardClass board) {
    int bestVal = minimax(board, 0, AI, -infinite, infinite);
    print("bestVAl: "+bestVal.toString());
    return bestMove == -1 ? initMove : bestMove;
  }

  int minimax(BoardClass board, int depth, int currentPlayer, int alpha,
      int beta) {
    int alternatePlayer = (currentPlayer == AI) ? HUMAN : AI;

    if (board.searchForMatch(5, alternatePlayer) > 0) {
      print(currentPlayer);
      if (alternatePlayer == AI)
        return infinite - depth;
      else
        return -infinite + depth;
    }

    if (depth > maxDepth)
      return cutOffEvaluation(board, alternatePlayer);

    int bestVal;
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

                  bestVal = infinite;
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

  int cutOffEvaluation(BoardClass board, int currentPlayer ) {
    int value = 0;
    int alternatePlayer = (currentPlayer == AI) ? HUMAN : AI;
    int sign = (currentPlayer == AI) ? 1 : -1;
//

    value += sign*190500*board.searchForLooseEnds(4, 2, currentPlayer);
    value -= sign*190500*board.searchForLooseEnds(4, 2, alternatePlayer);

    value += sign*95000*board.searchForLooseEnds(4, 1, currentPlayer);
    value -= sign*95000*board.searchForLooseEnds(4, 1, alternatePlayer);

    value += sign*84000*board.searchForLooseEnds(3, 2, currentPlayer);
    value -= sign*84000*board.searchForLooseEnds(3, 2, alternatePlayer);

    value += sign*400*board.searchForLooseEnds(3, 1, currentPlayer);
    value -= sign*400*board.searchForLooseEnds(3, 1, alternatePlayer);

    value += sign*300*board.searchForLooseEnds(2, 2, currentPlayer);
    value -= sign*300*board.searchForLooseEnds(2, 2, alternatePlayer);

    value += sign*30*board.searchForLooseEnds(2, 1, currentPlayer);
    value -= sign*30*board.searchForLooseEnds(2, 1, alternatePlayer);


    return value;
  }
}
