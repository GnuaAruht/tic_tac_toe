part of 'home_page.dart';

class GameIconsWidget extends StatelessWidget {
  const GameIconsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 54.0,
          height: 54.0,
          child: CrossWidget(
            strokeWidth: 18.0,
          ),
        ),
        SizedBox(
          width: 24.0,
        ),
        SizedBox(
          width: 54.0,
          height: 54.0,
          child: CircleWidget(
            strokeWidth: 16.0,
          ),
        ),
      ],
    );
  }
}
