import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic tac toe'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            9,
            (index) => Box(
              index: index + 1,
            ),
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int index;
  Box({
    Key? key,
    required this.index,
  }) : super(key: key);

  final borderColor = Colors.grey.withOpacity(0.5);
  final borderWidth = 1.6;
  final borderStyle = BorderStyle.solid;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: _getBorder(index),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: const TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
