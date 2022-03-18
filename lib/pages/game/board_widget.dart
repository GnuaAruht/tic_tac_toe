part of 'game_page.dart';

class BoardWidget extends StatelessWidget {
  final double size;
  const BoardWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(size),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1.0,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          9,
          (index) => _Field(
            index: index,
            onTap: (idx) {},
            isEnable: true,
            playerSymbol: "X",
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final int index;
  final bool isEnable;
  final ValueChanged<int> onTap;
  final String playerSymbol;
  const _Field({
    Key? key,
    required this.index,
    required this.isEnable,
    required this.onTap,
    required this.playerSymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? () => onTap(index) : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: _getBorder(index + 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: index % 2 != 0 ? const CrossWidget() : const CircleWidget(),
        ),
      ),
    );
  }

  Border _getBorder(int index) {
    switch (index) {
      case 1:
        return const Border(
            right: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 2:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            right: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 3:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 4:
        return const Border(
          right: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
        );
      case 5:
        return Border.all(
          color: borderColor,
          width: borderWidth,
          style: borderStyle,
        );
      case 6:
        return const Border(
          left: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
        );
      case 7:
        return const Border(
          right: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
        );
      case 8:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            right: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            top: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 9:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            top: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      default:
        throw ArgumentError('Unknown index : $index');
    }
  }
}
