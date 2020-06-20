import 'package:flutter/material.dart';

class DiceImage extends StatelessWidget {
  final Function onPress;
  final Image image;
  final width;
  final Color color;
  DiceImage({this.onPress, this.image, this.width, this.color});

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
              offset: Offset(4, 0),
            ),
          ],
          color: color,
        ),
        child: GestureDetector(onTap: onPress, child: image));
  }
}
