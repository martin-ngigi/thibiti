import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;

  SmallText({
    required this.text,
    this.color = const Color(0xff9a9897),
    this.size = 18,
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

