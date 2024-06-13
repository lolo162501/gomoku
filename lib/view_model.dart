import 'package:flutter/foundation.dart';

class GomokuViewModel extends ChangeNotifier {
  static const int boardSize = 19;
  final List<List<String>> _board =
      List.generate(boardSize, (_) => List.filled(boardSize, ''));
  String _currentPlayer = 'X';
  String? _winner;
  List<List<String>> get board => _board;
  String get currentPlayer => _currentPlayer;
  String? get winner => _winner;
  List<List<int>> _winningCells = [];
  List<List<int>> get winningCells => _winningCells;

  void makeMove(int row, int col) {
    if (_board[row][col].isEmpty && _winner == null) {
      _board[row][col] = _currentPlayer;
      if (checkWinner()) {
        _winner = _currentPlayer;
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  void resetGame() {
    for (var row in _board) {
      for (int i = 0; i < row.length; i++) {
        row[i] = '';
      }
    }
    _currentPlayer = 'X';
    _winner = null;
    _winningCells = [];
    notifyListeners();
  }

bool checkWinner() {
  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize - 4; j++) {
      if (List.generate(5, (k) => k).every((k) => _board[i][j + k] == _currentPlayer)) {
        _winningCells = List.generate(5, (k) => [i, j + k]);
        return true;
      }
      if (List.generate(5, (k) => k).every((k) => _board[j + k][i] == _currentPlayer)) {
        _winningCells = List.generate(5, (k) => [j + k, i]);
        return true;
      }
    }
  }
  for (int i = 0; i < boardSize - 4; i++) {
    for (int j = 0; j < boardSize - 4; j++) {
      if (List.generate(5, (k) => k).every((k) => _board[i + k][j + k] == _currentPlayer)) {
        _winningCells = List.generate(5, (k) => [i + k, j + k]);
        return true;
      }
      if (List.generate(5, (k) => k).every((k) => _board[i + k][j + 4 - k] == _currentPlayer)) {
        _winningCells = List.generate(5, (k) => [i + k, j + 4 - k]);
        return true;
      }
    }
  }
  return false;
}
}