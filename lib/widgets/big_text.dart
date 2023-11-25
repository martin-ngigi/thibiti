import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;

  BigText({
    required this.text,
    this.color = const Color(0xff000000),
    this.size = 22,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w300
      ),
    );
  }
}

