part of "game_page.dart";

class GameStatusWidget extends StatelessWidget {
  const GameStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircleWidget(),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "4 Wins",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: const [
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: CrossWidget(
                strokeWidth: 8.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "4 Wins",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.balance,
              size: 34.0,
              color: Colors.black45,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "4 Draws",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
