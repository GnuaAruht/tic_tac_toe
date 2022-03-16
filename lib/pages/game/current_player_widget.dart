part of 'game_page.dart';

class CurrentPlayerWidget extends StatelessWidget {
  const CurrentPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircleWidget(
            strokeWidth: 6.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "It's player 1 turn.",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
