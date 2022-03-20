part of "game_page.dart";

class GameStatusWidget extends GetWidget<GameController> {
  const GameStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const SizedBox(
              width: 30.0,
              height: 30.0,
              child: CrossWidget(
                strokeWidth: 8.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() => Text(
                  "${controller.player1Win} Wins",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircleWidget(),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() => Text(
                  "${controller.player2Win} Wins",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            const Icon(
              Icons.balance,
              size: 34.0,
              color: Colors.black45,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() => Text(
                  "${controller.draw} Draws",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
