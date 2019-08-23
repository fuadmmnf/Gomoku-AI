import 'dart:core';

class BoardClass{

  List <List<num>> board = new List.generate(10, (i) => new List(10));

  BoardClass(){

    for(int i=0;i<10;i++){
     for(int j=0;j<10;j++){
       board[i][j]=-1;
     }
    }

  }

  void changeEntry(int a, int b, int c){
    board[a][b]=c;
  }
  int getPlayer(int i, int j){
    return board[i][j];
  }

  void boardPrint(){
    print(board);
  }

  bool searchRow(int n,int currentPlayer){

    for(int row=0;row<10;row++){
      for(int i=0;i<=10-n;i++){
        if(board[row][i]==currentPlayer){
          int j;
          for(j=1;j<n;j++){
            if(board[row][i]!=board[row][i+j]){
              break;
            }
          }
          if(j==n){
            return true;
          }
        }
      }
    }

    return false;
  }


  bool searchColumn(int n,int currentPlayer){

    for(int col=0;col<10;col++){
      for(int i=0;i<=10-n;i++){
        if(board[i][col]==currentPlayer){
          int j;
          for(j=1;j<n;j++){
            if(board[i][col]!=board[i+j][col]){
              break;
            }
          }
          if(j==n){
            return true;
          }
        }
      }
    }

    return false;
  }


  bool searchRightDiagonal(int n,int currentPlayer){

    for(int row=0;row<10;row++){
      for(int i=0;i<=10-n;i++){
        if(board[row][i]==currentPlayer){
          int j;
          for(j=1;j<n;j++){
            if(board[row][i]!=board[row+j][i+j]){
              break;
            }
          }
          if(j==n){
            return true;
          }
        }
      }
    }

    return false;
  }


  bool searchLeftDiagonal(int n,int currentPlayer){

    for(int row=9;row>=0;row--){
      for(int i=0;i<=10-n;i++){
        if(board[row][i]==currentPlayer){
          int j;
          for(j=1;j<n;j++){
            if(board[row][i]!=board[row-j][i+j]){
              break;
            }
          }
          if(j==n){
            return true;
          }
        }
      }
    }

    return false;
  }



  bool searchForMatch(int n,int currentPlayer){

    if(searchRow(n,currentPlayer))
     return true;
    else if(searchColumn(n,currentPlayer))
      return true;
//    else if(searchRightDiagonal(n,currentPlayer))
//      return true;
//    else if(searchLeftDiagonal(n,currentPlayer))
//      return true;

    return false;

  }

}