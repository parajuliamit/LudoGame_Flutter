import 'package:flutter/material.dart';

class WinnerPageTile extends StatelessWidget {
  const WinnerPageTile({super.key, required this.color, required this.text, required this.icon});

  final String text;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(1, 4),
            ),
          ],
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
