import 'dart:math';

import 'package:tic_tac_toe_ai/algorithms/game_logic.dart';

const String aI = 'O'; // Maximizing player
const String human = 'X'; // Minimizing player
const int negativeInfinite = -9999;
const int infinite = 9999;

int findBestMove(List<String> board) {
  int bestMove = -1;
  int bestValue = negativeInfinite;
  for (int i = 0; i < 9; ++i) {
    if (board[i] == '') {
      board[i] = aI;
      int moveValue = minimax(board, false, negativeInfinite, infinite);
      board[i] = '';

      if (moveValue > bestValue) {
        bestValue = moveValue;
        bestMove = i;
      }
    }
  }
  return bestMove;
}

int minimax(List<String> board, bool isMax, int alpha, int beta) {
  if (checkResult(board, aI)) return 1;
  if (checkResult(board, human)) return -1;
  if (isDraw(board)) return 0;

  if (isMax) {
    int best = negativeInfinite;
    for (int i = 0; i < 9; ++i) {
      if (board[i] == '') {
        board[i] = aI;
        best = max(best, minimax(board, false, alpha, beta));
        board[i] = '';
        // Applying pruning
        alpha = max(alpha, best);
        if (alpha >= beta) {
          return best;
        }
      }
    }
    return best;
  } else {
    int best = infinite;
    for (int i = 0; i < 9; ++i) {
      if (board[i] == '') {
        board[i] = human;
        best = min(best, minimax(board, true, alpha, beta));
        board[i] = '';
        // Applying pruning
        beta = min(beta, best);
        if (alpha >= beta) {
          return best;
        }
      }
    }
    return best;
  }
}
