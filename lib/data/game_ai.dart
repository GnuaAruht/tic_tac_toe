import 'game_util.dart';

class GameAI {
  static const WIN_SCORE = 10;
  static const LOSE_SCORE = -10;
  static const DRAW_SCORE = 0;

  static int play(List<int> board, int currentPlayer) {
    return getAIMove(board, currentPlayer);
  }

  static int getAIMove(List<int> board, int currentPlayer) {
    List<int> _newBoard;
    int _bestScore = -10000;
    int _bestMove = -1;

    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      if (!GameUtil.isValidMove(board, currentMove)) continue;
      _newBoard = List.from(board);
      _newBoard[currentMove] = currentPlayer;
      int _newScore = getBestScore(_newBoard, currentPlayer);
      if (_newScore > _bestScore) {
        _bestScore = _newScore;
        _bestMove = currentMove;
      }
    }

    return _bestMove;
  }

  static int getBestScore(List<int> board, int currentPlayer) {
    final _winner = GameUtil.checkIfWinnerFound(board);
    if (_winner == currentPlayer) {
      return WIN_SCORE;
    } else if (_winner == GameUtil.togglePlayer(currentPlayer)) {
      return LOSE_SCORE;
    } else if (_winner == GameUtil.DRAW) {
      return DRAW_SCORE;
    }
    return getAIMove(board, GameUtil.togglePlayer(currentPlayer));
  }
}
