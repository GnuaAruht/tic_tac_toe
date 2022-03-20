import 'game_util.dart';

class Board {
  late List<int> board;

  Board() {
    initialize();
  }

  void initialize() {
    board = List.generate(9, (index) => GameUtil.EMPTY);
  }

  void reinitialize() => initialize();

  void move(int idx, int player) {
    if (GameUtil.isValidMove(board, idx)) {
      board[idx] = player;
    }
  }

  bool isEnable(int idx) => GameUtil.isValidMove(board, idx);

  int getDataAt(int idx) {
    return board[idx];
  }
}
