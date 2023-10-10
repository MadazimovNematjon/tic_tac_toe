import 'dart:math';

class GameService {
  static List<String> board = List.filled(9, "");

  static String winner = "";
  static String player = "X";

  /* winning combinations */

  static List<List<int>> lines = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
    [0, 4, 8], [2, 4, 6], // diagonals
  ];

  /* a function that determines a winner or a tie */

  static winnerGame() {
    for (var line in lines) {
      var a = board[line[0]];
      var b = board[line[1]];
      var c = board[line[2]];

      if (a == b && b == c && a != "") {
        winner = a;
        break;
      }
    }
    if (winner == "" && !board.contains("")) {
      winner = "Draw";
    }
  }

  /* Restart Function */

  static void restartGame() {
    board = List.filled(9, "");
    player = "X";
    winner = "";
  }

  /* a function that performs a computer action */

  static pcGame(Function(int) playMove) {
    bool check = false;
    final random = Random();
    List<int> list = [];

    for (var line in lines) {

      var a = board[line[0]];
      var b = board[line[1]];
      var c = board[line[2]];

      if (a.isEmpty && b == c && b != "") {
        playMove(line[0]);
        print("a$a");
        break;
      }
      if (b.isEmpty && a == c && a != "") {
        print("b$b");
        playMove(line[1]);
        break;
      }
      if (c.isEmpty && a == b && a != "") {
        print("b$c");
        playMove(line[2]);
        break;
      }
    }

    if (player == "O") {
      for (int i = 0; i < board.length; i++) {
        if (board[i].isEmpty && winner.isEmpty) {
          if (i == 4) {
            print("4 bo'sh"); ////
            playMove(4);
            break;
          }
          if (i == 8 && 4 == "O") {
            playMove(8);
            break;
          } else {
            list.add(i);
            check = true;
          }
        }
      }
    }

    if (check && player == "O") {
      print(check);
      int index = list[random.nextInt(list.length)];

      playMove(index);
    }
  }
}
