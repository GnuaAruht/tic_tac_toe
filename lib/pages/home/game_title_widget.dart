part of 'home_page.dart';

class GameTitleWidget extends StatelessWidget {
  const GameTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Tic Tac Toe",
      style: TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
