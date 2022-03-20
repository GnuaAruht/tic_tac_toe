import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/ui_constants.dart';
import '../../controller/game_controller.dart';
import '../../game_ai/game_util.dart';
import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

part 'board_widget.dart';
part 'current_player_widget.dart';
part 'game_action_widget.dart';
part 'game_status_widget.dart';

class GamePageBinding extends Bindings {
  final bool isMultiPlayer;

  GamePageBinding({required this.isMultiPlayer});

  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController(isMultiPlayer));
  }
}

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              const Spacer(),
              const GameStatusWidget(),
              const Spacer(flex: 2),
              BoardWidget(size: MediaQuery.of(context).size.width * 0.76),
              const Spacer(),
              const CurrentPlayerWidget(),
              const Spacer(),
              const GameActionWidget(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool?> showConfirmDialog({
  required BuildContext context,
  String title = "Confirm!",
  required String content,
}) async {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text("Ok"),
        ),
      ],
    ),
  );
}
