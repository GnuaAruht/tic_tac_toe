part of 'game_page.dart';

class BoardWidget extends GetWidget<GameController> {
  final double size;
  const BoardWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(size),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _listenBoardData(),
          _listenAiPlaying(),
          _listenGameResult(),
        ],
      ),
    );
  }

  Widget _listenAiPlaying() {
    return Obx(() => IgnorePointer(
          ignoring: !controller.isAiPlaying.value,
          child: Container(
            color: Colors.transparent,
          ),
        ));
  }

  Widget _listenGameResult() {
    return Obx(
      () => IgnorePointer(
        ignoring: controller.gameResult.value == 0,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          color: controller.gameResult.value != 0
              ? Colors.grey.withOpacity(0.2)
              : Colors.transparent,
          child: _buildForGameResult(),
        ),
      ),
    );
  }

  Widget? _buildForGameResult() {
    final _gameResultStatus = controller.gameResultStatus;
    if (_gameResultStatus != null) {
      return Text(
        _gameResultStatus,
        style: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return null;
  }

  Widget _listenBoardData() {
    return Obx(
      () => GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1.0,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          controller.board.length,
          (index) => _Field(
            index: index,
            onTap: (idx) {
              controller.move(idx);
            },
            isEnable: controller.isEnable(index),
            playerId: controller.getDataAt(index),
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
  final int playerId;
  const _Field({
    Key? key,
    required this.index,
    required this.isEnable,
    required this.onTap,
    required this.playerId,
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
          child: _getPlayerWidget(playerId),
        ),
      ),
    );
  }

  Widget? _getPlayerWidget(int playerId) {
    switch (playerId) {
      case GameUtil.Player1:
        return const CrossWidget();
      case GameUtil.Player2:
        return const CircleWidget();
      default:
        return null;
    }
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
