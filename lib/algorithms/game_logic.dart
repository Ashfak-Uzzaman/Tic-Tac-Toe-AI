// Winning positions: rows, columns, and diagonals
final List<List<int>> winPositions = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

// List to represent the board state
List<String> board = ['', '', '', '', '', '', '', '', ''];

bool checkResult(List<String> board, String player) {
  for (var position in winPositions) {
    if (board[position[0]] == board[position[1]] &&
        board[position[0]] == board[position[2]] &&
        board[position[0]] == player) {
      return true;
    }
  }
  return false;
}

bool isDraw(List<String> board) => board.every((cell) => cell.isNotEmpty);
