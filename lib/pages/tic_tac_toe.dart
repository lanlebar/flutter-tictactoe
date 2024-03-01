import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<String> board = List.filled(9, "");
  String currentPlayer = "X";

  void handleMove(int index) {
    if (board[index] == "") {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      });
      checkWinner();
    }
  }

void checkWinner() {
  for (int i = 0; i < 9; i += 3) {
    if (board[i] != "" && board[i] == board[i + 1] && board[i + 1] == board[i + 2]) {
      showWinnerDialog(board[i]);
      return;
    }
  }

  for (int i = 0; i < 3; i++) {
    if (board[i] != "" && board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
      showWinnerDialog(board[i]);
      return;
    }
  }

  if (board[0] != "" && board[0] == board[4] && board[4] == board[8]) {
    showWinnerDialog(board[0]);
    return;
  } else if (board[2] != "" && board[2] == board[4] && board[4] == board[6]) {
    showWinnerDialog(board[2]);
    return;
  }

  // Check for draw
  if (!board.contains("")) {
    showDrawDialog();
  }
}


  void showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Draw!"),
          content: const Text("The game is a draw."),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.pop(context);
              },
              child: const Text("Play again"),
            ),
          ],
        );
      },
    );
  }

  void showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Winner!"),
          content: Text("Player $winner wins!"),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.pop(context);
              },
              child: const Text("Play again"),
            ),
          ],
        );
      },
    );
  }

  // Function to reset the game
  void resetGame() {
    setState(() {
      board = List.filled(9, "");
      currentPlayer = "X";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        height: 500,
        child: Center(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => handleMove(index),
                  child: Text(board[index]),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
