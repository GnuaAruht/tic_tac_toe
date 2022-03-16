part of 'game_page.dart';

class GameActionWidget extends StatelessWidget {
  const GameActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
            primary: Colors.blueGrey.withOpacity(0.8),
          ),
          child: const Icon(
            Icons.refresh,
            size: 42.0,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
            primary: Colors.blueGrey.withOpacity(0.8),
            elevation: 0.0,
          ),
          child: const Icon(
            Icons.home,
            size: 42.0,
          ),
        )
      ],
    );
  }
}
