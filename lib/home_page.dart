import 'package:flutter/material.dart';

import 'widgets/circle_widget.dart';
import 'widgets/cross_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onTap(int idx) {}

  void togglePlayer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic tac toe'),
      ),
      body: Center(
        child: SizedBox(
          height: 300.0,
          width: 300.0,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1.0,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              9,
              (index) => Field(
                index: index,
                onTap: onTap,
                isEnable: true,
                playerSymbol: "X",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  final int index;
  final bool isEnable;
  final ValueChanged<int> onTap;
  final String playerSymbol;
  Field({
    Key? key,
    required this.index,
    required this.isEnable,
    required this.onTap,
    required this.playerSymbol,
  }) : super(key: key);

  final borderColor = Colors.grey.withOpacity(0.5);
  final borderWidth = 1.6;
  final borderStyle = BorderStyle.solid;

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
          padding: const EdgeInsets.all(28.0),
          child: index % 2 == 0 ? const CrossWidget() : const CircleWidget(),
        ),
        // child: Align(
        //   alignment: Alignment.center,
        //   child: Text(playerSymbol),
        // ),
      ),
    );
  }

  Border _getBorder(int index) {
    switch (index) {
      case 1:
        return Border(
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
        return Border(
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
        return Border(
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
        return Border(
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
        return Border(
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
        return Border(
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
        return Border(
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
        return Border(
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
