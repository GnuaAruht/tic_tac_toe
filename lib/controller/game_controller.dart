import 'package:get/get.dart';

import '../game_ai/game_ai.dart';
import '../game_ai/game_util.dart';

class GameController extends GetxController {
  var player1Win = 0.obs;
  var player2Win = 0.obs;
  var draw = 0.obs;

  final bool isMultiPlayer;
  RxList<int> board = List.generate(9, (index) => 0).obs;
  RxInt currentPlayer = GameUtil.Player1.obs;
  RxInt gameResult = GameUtil.NO_WINNER_YET.obs;
  RxBool isAiPlaying = false.obs;
  GameAI ai = GameAI();

  GameController(this.isMultiPlayer);

  void reinitialize() {
    board.value = List.generate(9, (index) => 0);
    gameResult.value = GameUtil.NO_WINNER_YET;
    currentPlayer.value = GameUtil.Player1;
  }

  Future<void> move(int idx) async {
    board[idx] = currentPlayer.value;
    checkGameWinner();
    togglePlayer();
    if (!isMultiPlayer && gameResult.value == GameUtil.NO_WINNER_YET) {
      isAiPlaying.value = true;
      await Future.delayed(const Duration(milliseconds: 1800));
      final _aiMove = await Future(
        () => ai.play(
          board,
          currentPlayer.value,
        ),
      );
      board[_aiMove] = currentPlayer.value;
      isAiPlaying.value = false;
      checkGameWinner();
      togglePlayer();
    }
  }

  bool isEnable(int idx) => board[idx] == GameUtil.EMPTY;

  int getDataAt(int idx) => board[idx];

  void togglePlayer() {
    currentPlayer.value = GameUtil.togglePlayer(currentPlayer.value);
  }

  void checkGameWinner() {
    gameResult.value = GameUtil.checkIfWinnerFound(board);
    switch (gameResult.value) {
      case GameUtil.Player1:
        player1Win++;
        break;
      case GameUtil.Player2:
        player2Win++;
        break;
      case GameUtil.DRAW:
        draw++;
        break;
    }
  }

  String? get currentPlayerMove {
    if (currentPlayer.value == GameUtil.Player1) {
      return "Player 1's move";
    } else if (currentPlayer.value == GameUtil.Player2) {
      return isMultiPlayer ? "Player 2's move" : "AI's move";
    }
    return null;
  }

  String? get gameResultStatus {
    final _gameResult = gameResult.value;
    if (_gameResult != GameUtil.NO_WINNER_YET) {
      if (_gameResult == GameUtil.Player1) {
        return "Player 1 wins";
      } else if (_gameResult == GameUtil.Player2) {
        return isMultiPlayer ? "Player 2 wins" : "AI wins";
      } else if (_gameResult == GameUtil.DRAW) {
        return "Draw";
      }
    }
    return null;
  }
}
