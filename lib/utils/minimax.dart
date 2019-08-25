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
    if(depth > maxDepth)
      return cutOffEvaluation(board);

    if(board.searchForMatch(5, HUMAN)> 0){
      if(board.searchForMatch(5, AI)>0)
        return infinite;
      return -infinite;
    } else if(board.searchForMatch(5, AI) >0){
      if(board.searchForMatch(5, HUMAN) >0){
        return -infinite;
      }
      return infinite;
    }
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

  int cutOffEvaluation(BoardClass board) {
    int value = 0;

    value += 2000 * board.searchForLooseEnds(4, 2, AI);
    value += 1800 * board.searchForLooseEnds(3, 2, AI);
    value += 100 * board.searchForLooseEnds(2, 2, AI);
    value += 1850 * board.searchForLooseEnds(4, 1, AI);
    value += 150 * board.searchForLooseEnds(3, 1, AI);
    value += 10 * board.searchForLooseEnds(2, 1, AI);

    value -= 2000 * board.searchForLooseEnds(4, 2, HUMAN);
    value -= 1800 * board.searchForLooseEnds(3, 2, HUMAN);
    value -= 100 * board.searchForLooseEnds(2, 2, HUMAN);
    value -= 1850 * board.searchForLooseEnds(4, 1, HUMAN);
    value -= 150 * board.searchForLooseEnds(3, 1, HUMAN);
    value -= 10 * board.searchForLooseEnds(2, 1, HUMAN);



    return value;
  }


}