import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    Key? key,
    required double height,
    required this.title,
  })  : _height = height,
        super(key: key);

  final double _height;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height,
        width: double.infinity,
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Text(title, style: const TextStyle(fontSize: 25)));
  }
}