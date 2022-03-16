import 'board.dart';
import 'game_ai.dart';
import 'game_util.dart';

class GamePresenter {
  late Board board;
  late int _currentPlayer;
  void Function(int status) showGameResult;

  bool isMultiPlayer = false;

  GamePresenter(this.showGameResult) {
    _currentPlayer = GameUtil.Player1;
    board = Board();
  }

  void onPlay(int idx) {
    board.move(idx, _currentPlayer);
    // todo: check game result
    if (isMultiPlayer) {
      GameUtil.togglePlayer(_currentPlayer);
    } else {
      final _aiMove = GameAI.play(
        board.board,
        GameUtil.AI,
      );
      board.move(idx, _aiMove);
      // todo: check game result
    }
  }

  void restartGame() {
    board.reinitialize();
  }
}
