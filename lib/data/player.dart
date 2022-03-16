import 'board.dart';

class Player {
  final int id;
  final String name;

  Player({
    required this.id,
    required this.name,
  });

  void play(int idx, Board board) {
    board.move(idx, id);
  }
}
