import 'package:flutter/material.dart';

import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

part 'board_widget.dart';
part 'current_player_widget.dart';
part 'game_action_widget.dart';
part 'game_status_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void onTap(int idx) {}

  void togglePlayer() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(
            children: [
              const GameStatusWidget(),
              const Spacer(flex: 2),
              BoardWidget(size: size.width * 0.76),
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
