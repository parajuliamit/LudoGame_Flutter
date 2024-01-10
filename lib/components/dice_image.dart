import 'package:flutter/material.dart';

class DiceImage extends StatelessWidget {
  final void Function() onPress;
  final Image image;
  final double width;
  final Color color;
  const DiceImage(
      {super.key, required this.onPress,
      required this.image,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width / 7.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(4, 0),
            ),
          ],
          color: color,
        ),
        child: GestureDetector(onTap: onPress, child: image));
  }
}
