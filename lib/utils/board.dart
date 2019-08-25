import 'dart:core';

class BoardClass {
  List<List<num>> board = new List.generate(10, (i) => new List(10));

  BoardClass() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        board[i][j] = -1;
      }
    }
  }

  void changeEntry(int a, int b, int c) {
    board[a][b] = c;
  }

  int getPlayer(int i, int j) {
    return board[i][j];
  }

  void boardPrint() {
    print(board);
  }

  BoardClass copyBoard() {
    BoardClass tempBoard = BoardClass();
    for (int i = 0; i < 10; i++)
      for (int j = 0; j < 10; j++)
        tempBoard.changeEntry(i, j, getPlayer(i, j));

    return tempBoard;
  }

  int searchRow(int n, int currentPlayer) {
    int counter = 0;
    for (int row = 0; row < 10; row++) {
      for (int i = 0; i <= 10 - n; i++) {
        if (board[row][i] == currentPlayer) {
          int j;
          for (j = 1; j < n; j++) {
            if (board[row][i] != board[row][i + j]) {
              break;
            }
          }
          if (j == n) {
            counter++;
          }
        }
      }
    }

    return counter;
  }

  int searchColumn(int n, int currentPlayer) {
    int counter = 0;
    for (int col = 0; col < 10; col++) {
      for (int i = 0; i <= 10 - n; i++) {
        if (board[i][col] == currentPlayer) {
          int j;
          for (j = 1; j < n; j++) {
            if (board[i][col] != board[i + j][col]) {
              break;
            }
          }
          if (j == n) {
            counter++;
          }
        }
      }
    }

    return counter;
  }

  int searchRightDiagonal(int n, int currentPlayer) {
    int counter = 0;
    for (int row = 0; row <= 10 - n; row++) {
      for (int i = 0; i <= 10 - n; i++) {
        if (board[row][i] == currentPlayer) {
          int j;
          for (j = 1; j < n; j++) {
            if (board[row][i] != board[row + j][i + j]) {
              break;
            }
          }
          if (j == n) {
            counter++;
          }
        }
      }
    }

    return counter;
  }

  int searchLeftDiagonal(int n, int currentPlayer) {
    int counter = 0;
    for (int row = 9; row >= 9 - n; row--) {
      for (int i = 0; i <= 10 - n; i++) {
        if (board[row][i] == currentPlayer) {
          int j;
          for (j = 1; j < n; j++) {
            if (board[row][i] != board[row - j][i + j]) {
              break;
            }
          }
          if (j == n) {
            counter++;
          }
        }
      }
    }

    return counter;
  }

  int searchForMatch(int n, int currentPlayer) {
    return searchRow(n, currentPlayer) +
        searchColumn(n, currentPlayer) +
        searchRightDiagonal(n, currentPlayer) +
        searchLeftDiagonal(n, currentPlayer);
  }

  int searchForLooseEnds(int n, int looseEndCount, int currentPlayer) {
    return (searchRowForLooseEnd(n, looseEndCount, currentPlayer) +
        searchColumnForLooseEnd(n, looseEndCount, currentPlayer)) ;
//        searchLeftDiagonalForLooseEnd(n, looseEndCount, currentPlayer) +
//        searchRightDiagonalForLooseEnd(n, looseEndCount, currentPlayer));

  }

  bool isBoardFinished() {
    for (int i = 0; i < 10; i++)
      for (int j = 0; j < 10; j++)
        if (board[i][j] == -1) return false;

    return true;
  }

  int searchColumnForLooseEnd(int n, int looseEndCount, int currentPlayer) {
    int counter = 0;

    if (looseEndCount == 2) {
      for (int col = 0; col < 10; col++) {
        for (int i = 0; i + n + 1 < 10; i++) {
          bool matchfound = true;
          if (board[i][col] == -1 && board[i + n + 1][col] == -1) {
            for (int k = i + 1; k < i + n + 1; k++) {
              if (board[k][col] != currentPlayer){
                matchfound = false;
                break;
              }
            }
          }
          if (matchfound) counter++;
        }
      }
    } else {
      for (int col = 0; col < 10; col++) {
        for (int i = 0; i + n < 10; i++) {
          bool matchfound = true;
          if (board[i][col] == -1) {
            for (int k = i + 1; k < i + n; k++) {
              if (board[k][col] != currentPlayer)
                {
                  matchfound = false;
                  break;
                }
            }
          }
          if (matchfound) counter++;

          matchfound = true;
          if (board[i + n][col] == -1) {
            for (int k = i; k < i + n; k++) {
              if (board[k][col] != currentPlayer) {
                matchfound = false;
                break;
              }
            }
          }
          if (matchfound) counter++;
        }
      }
    }
    return counter;
  }

  int searchRowForLooseEnd(int n, int looseEndCount, int currentPlayer) {
    int counter = 0;
    if (looseEndCount == 2) {
      for (int row = 0; row < 10; row++) {
        for (int i = 0; i + n + 1 < 10; i++) {
          bool matchfound = true;
          if (board[row][i] == -1 && board[row][i + n + 1] == -1) {
            for (int k = i + 1; k < i + n + 1; k++) {
              if (board[row][k] != currentPlayer) {
                matchfound = false;
                break;
              }
            }
          }
          if (matchfound) counter++;
        }
      }
    } else {
      for (int row = 0; row < 10; row++) {
        for (int i = 0; i + n < 10; i++) {
          bool matchfound = true;
          if (board[row][i] == -1) {
            for (int k = i + 1; k < i + n; k++) {
              if (board[row][k] != currentPlayer) {
                matchfound = false;
                break;
              }
            }
          }
          if (matchfound) counter++;

          matchfound = true;
          if (board[row][i + n] == -1) {
            for (int k = i; k < i + n ; k++) {
              if (board[row][k] != currentPlayer) {
                matchfound = false;
                break;
              }
            }
          }
          if (matchfound) counter++;
        }
      }
    }
    return counter;
  }

  int searchLeftDiagonalForLooseEnd(int n, int looseEndCount,
      int currentPlayer) {
    int counter = 0;

    if (looseEndCount == 2) {
      for (int row = 0; row + n + 1 < 10; row++) {
        for (int i = 0; i + n + 1 < 10; i++) {
          bool matchfound = true;
          if ( board[row][i] == -1 && board[row + n + 1][i + n + 1] == -1) {
            for (int k = i + 1; k < i + n + 1; k++) {
              if (board[row + (k - i - 1)][k] != currentPlayer)
                matchfound = false;
            }
          }
          if (matchfound) counter++;
        }
      }
    } else {
      for (int row = 0; row + n  < 10; row++) {
        for (int i = 0; i + n  < 10; i++) {
          bool matchfound = true;
          if (board[row][i] == -1) {
            for (int k = i + 1; k < i + n ; k++) {
              if (board[row + (k - i )][k] != currentPlayer)
                matchfound = false;
            }
          }
          if (matchfound) counter++;

          matchfound = true;
          if (board[row + n][i + n] == -1) {
            for (int k = i; k < i + n ; k++) {
              if (board[row + (k - i)][k] != currentPlayer)
                matchfound = false;
            }
          }
          if (matchfound) counter++;
        }
      }
    }
    return counter;
  }

  int searchRightDiagonalForLooseEnd(int n, int looseEndCount,
      int currentPlayer) {
    int counter = 0;

    if (looseEndCount == 2) {
      for (int row = 9; row - n - 1 >= 0; row--) {
        for (int i = 0; i+n+1 <10; i++) {
          bool matchfound = true;
          if (board[row][i] == -1 && board[row - n - 1][i + n + 1] == -1) {
            for (int k = i + 1; k < i + n + 1; k++) {
              if (board[row - (k - i - 1)][k] != currentPlayer)
                matchfound = false;
            }
          }
          if (matchfound) counter++;
        }
      }
    } else {
      for (int row = 9; row - n  >= 0; row--) {
        for (int i = 0; i+n <10; i++) {
          bool matchfound = true;
          if (board[row][i] == -1) {
            for (int k = i + 1; k < i + n; k++) {
              if (board[row - (k - i - 1)][k] != currentPlayer)
                matchfound = false;
            }
          }
          if (matchfound) counter++;

          matchfound = true;
          if (board[row - n - 1][i + n] == -1) {
            for (int k = i; k <i+n; k++) {
              if (board[row - (k - i)][k] != currentPlayer)
                matchfound = false;
            }
          }
          if (matchfound) counter++;
        }
      }
    }

    return counter;
  }

}

