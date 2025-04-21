import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ai/algorithms/game_logic.dart';
import 'package:tic_tac_toe_ai/components/text.dart';
import 'package:tic_tac_toe_ai/constants/colors.dart';

class MultiplayerGameScreen extends StatefulWidget {
  const MultiplayerGameScreen({super.key});

  @override
  State<MultiplayerGameScreen> createState() => _MultiplayerGameScreenState();
}

class _MultiplayerGameScreenState extends State<MultiplayerGameScreen> {
  bool start = false;
  bool gameEnd = false;

  int playerOScore = 0;
  int playerXScore = 0;

  String commentary = '';
  String resetButtonText = 'Click to Start';

  bool xActivePlayer = true;

// Grid's cell color. Will change at winning stage
  List<Color> cellColors = List.filled(9, MainColor.accentColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainText(
                        text: 'Player X',
                        fontSize: 35,
                        color: MainColor.accentColor,
                      ),
                      MainText(
                        text: '$playerXScore',
                        fontSize: 48,
                        color: MainColor.accentColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainText(
                        text: 'Player O',
                        fontSize: 35,
                        color: MainColor.accentColor,
                      ),
                      MainText(
                        text: '$playerOScore',
                        fontSize: 48,
                        color: MainColor.accentColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (!gameEnd && start && board[index] == '') {
                          setState(() {
                            playerTap(index);
                          });
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: cellColors[index],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 5,
                              color: MainColor.secondaryColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              board[index],
                              style: TextStyle(
                                  fontFamily: 'FontMain',
                                  fontSize: 64,
                                  color: MainColor.primaryColor),
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: MainText(
                      text: commentary,
                      fontSize: 40,
                      color: MainColor.accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.accentColor,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          if (start) {
                            restartGame();
                          } else {
                            start = true;
                            commentary = 'X\'s Turn';
                            resetButtonText = 'Restart Game';
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MainText(
                          text: resetButtonText,
                          fontSize: 30,
                          color: MainColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void playerTap(int index) {
    if (xActivePlayer) {
      board[index] = 'X';
      xActivePlayer = !xActivePlayer;
      if (checkResult(board, 'X')) {
        commentary = 'Player - X won';
        playerXScore++;
        gameEnd = true;
        changeGreedColor();
        resetButtonText = 'Play Again';
        return;
      }
      commentary = 'O\'s Turn';
    } else {
      board[index] = 'O';
      xActivePlayer = !xActivePlayer;
      if (checkResult(board, 'O')) {
        commentary = 'Player - O won';
        playerOScore++;
        gameEnd = true;
        changeGreedColor();
        resetButtonText = 'Play Again';
        return;
      }
      commentary = 'X\'s Turn';
    }

    if (isDraw(board)) {
      commentary = 'Drawn';
      gameEnd = true;

      resetButtonText = 'Play Again';
    } else {
      resetButtonText = 'Restart Game';
    }
  }

  void changeGreedColor() {
    for (var position in winPositions) {
      if (board[position[0]] == board[position[1]] &&
          board[position[0]] == board[position[2]] &&
          board[position[0]] != '') {
        cellColors[position[0]] = MainColor.winningColor;
        cellColors[position[1]] = MainColor.winningColor;
        cellColors[position[2]] = MainColor.winningColor;
      }
    }
  }

  void restartGame() {
    for (int i = 0; i < 9; ++i) {
      board[i] = '';
      cellColors[i] = MainColor.accentColor;
    }

    gameEnd = gameEnd ? !gameEnd : gameEnd;
    xActivePlayer = true;

    resetButtonText = 'Restart Game';
    commentary = 'X\'s Turn';
  }
}
