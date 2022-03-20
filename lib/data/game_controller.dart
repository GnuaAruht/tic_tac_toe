import 'package:get/get.dart';

import 'game_util.dart';

class GameController extends GetxController {
  var player1Win = 0.obs;
  var player2Win = 0.obs;
  var draw = 0.obs;

  final bool isMultiPlayer;
  RxList<int> board = List.generate(9, (index) => 0).obs;
  RxInt currentPlayer = GameUtil.Player1.obs;
  RxInt gameResult = GameUtil.NO_WINNER_YET.obs;

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
}
