import 'dart:math';
import 'board.dart';


class Minimax{
  final infinite = 100000000;
  final int AI = 2;
  final int HUMAN = 1;


  int bestMove;

  final maxDepth = 3;
  var dX = [0, 0, 1, -1, 1, -1, 1, -1];
  var dY = [1, -1, 0, 0, 1, -1, -1, 1];


  int generateBestMove(BoardClass board){

    int bestVal = minimax(board, 0, AI, -infinite, infinite);
    return bestMove;
  }

  int minimax(BoardClass board, int depth, int currentPlayer, int alpha, int beta){

    int alternatePlayer = (currentPlayer == AI)? HUMAN:AI;

    if(board.searchForMatch(5, alternatePlayer)> 0){
      if(alternatePlayer == AI) return infinite;
      else return -infinite;
    }

    if(depth > maxDepth)
      return cutOffEvaluation(board, alternatePlayer);


    int bestVal;
    List<BoardClass> blankTiles = [];
    List<bool> isExpanded = List(100);
    List<int> changeList = [];

    for(int i=0; i<100; i++) {
      isExpanded[i] = false;
    }


    for(int i=0; i<10; i++){
      for(int j=0; j<10; j++){
        if(board.getPlayer(i, j) != -1){

          for(int it=0; it<8; it++) {
            if((i+dX[it]>=0 && i+dX[it]<10) && (j+dY[it]>=0 && j+dY[it]<10))
              if(board.getPlayer(i+dX[it], j+dY[it]) ==  -1){
                if(isExpanded[(i+dX[it])*10 + j+dY[it]] == false){
                  isExpanded[(i+dX[it])*10 + j+dY[it]] = true;
                  blankTiles.add(board.copyBoard());
                  blankTiles[blankTiles.length-1].changeEntry(i+dX[it], j+dY[it], currentPlayer);
                  changeList.add((i+dX[it])*10 + j+dY[it]);
                }
              }
          }

        }
      }
    }









    if(currentPlayer == AI){
      bestVal = -infinite;

      for(int i=0; i<blankTiles.length; i++){
        BoardClass tempBoard = blankTiles[i];
        bestVal = max(bestVal,  minimax(tempBoard, depth+1, HUMAN, alpha, beta));
        if(bestVal > alpha){
          alpha = bestVal;
          bestMove = changeList[i];
        }
        if( beta <= alpha)
          break;
      }
      return bestVal;
    }
    else{
      bestVal = infinite;

      for(BoardClass tempBoard in blankTiles){
        bestVal = min(bestVal, minimax(tempBoard, depth+1, AI, alpha, beta));
        beta = min(beta, bestVal);
        if( beta <= alpha)
          break;
      }
      return bestVal;
    }

  }

  int cutOffEvaluation(BoardClass board, int currentPlayer ) {
    int value = 0;
    int alternatePlayer = (currentPlayer == AI)? HUMAN:AI;
    int sign = (currentPlayer == AI)? 1 : -1;
//

    if( board.searchForLooseEnds(4, 2, alternatePlayer)>0)
      return -sign*infinite;

    if( board.searchForLooseEnds(4, 2, currentPlayer)>0)
      return sign*infinite;


//    if( board.searchForLooseEnds(4, 1, alternatePlayer)>0)
//      return -sign*infinite;
//    if( board.searchForLooseEnds(4, 1, currentPlayer)>0)
//      return sign*infinite;
//

    if( board.searchForLooseEnds(3, 2, alternatePlayer)>0)
      return -sign*infinite;
    if( board.searchForLooseEnds(3, 2, currentPlayer)>0)
      return sign*infinite;


    value +=  sign*2510* board.searchForLooseEnds(4, 1, currentPlayer);
    value += sign*200 * board.searchForLooseEnds(3, 1, currentPlayer);
//
    value -= sign*2500* board.searchForLooseEnds(4, 1, alternatePlayer);
    value -= sign*200 * board.searchForLooseEnds(3, 1, alternatePlayer);
//


    return value;
  }


}