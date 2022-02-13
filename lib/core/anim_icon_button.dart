import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  final Function function;

  const AnimatedIconButton({Key? key, required this.function}) : super(key: key);

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late bool toggleIcon = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: FloatingActionButton(
          onPressed: () {
            _controller.isCompleted ? _controller.reverse() : _controller.forward();
            widget.function.call();
          },
          tooltip: 'Apply Animation',
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _controller,
          ),
        ));
  }
}