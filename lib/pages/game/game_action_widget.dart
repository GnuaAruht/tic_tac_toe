part of 'game_page.dart';

class GameActionWidget extends GetWidget<GameController> {
  const GameActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _GameActionButton(
          icon: Icons.refresh,
          onPressed: () {
            controller.reinitialize();
          },
        ),
        _GameActionButton(
          icon: Icons.home,
          onPressed: () async {
            Get.back();
          },
        )
      ],
    );
  }
}

class _GameActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _GameActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        primary: Colors.blueGrey.withOpacity(0.8),
        elevation: 0.0,
      ),
      child: Icon(
        icon,
        size: 42.0,
      ),
    );
  }
}
