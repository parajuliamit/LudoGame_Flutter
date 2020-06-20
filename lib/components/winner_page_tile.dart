import 'package:flutter/material.dart';

class WinnerPageTile extends StatelessWidget {
  WinnerPageTile({this.color, this.text, this.icon});

  String text;
  Color color;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(1, 4),
            ),
          ],
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
