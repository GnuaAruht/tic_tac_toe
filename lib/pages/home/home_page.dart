import 'package:flutter/material.dart';

import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

part 'game_title_widget.dart';
part 'game_icons_widget.dart';
part 'game_mode_selection_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            GameTitleWidget(),
            SizedBox(height: 28.0),
            GameIconsWidget(),
            SizedBox(height: 38.0),
            GameModeSelectionWidget(),
          ],
        ),
      ),
    );
  }
}
