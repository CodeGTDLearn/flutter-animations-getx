import 'package:flutter/material.dart';

class ControllerMultiple extends StatefulWidget {
  const ControllerMultiple({Key? key}) : super(key: key);

  @override
  _ControllerMultipleState createState() => _ControllerMultipleState();
}

class _ControllerMultipleState extends State<ControllerMultiple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _sizeAnimation;

  late double _balloonHeight;
  late double _balloonWidth;
  late double _balloonBottomLocation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 4), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _balloonHeight = MediaQuery.of(context).size.height / 2;
    _balloonWidth = MediaQuery.of(context).size.height / 3;
    _balloonBottomLocation = MediaQuery.of(context).size.height - _balloonHeight;

    //Interval: Define a sequencia das animacoes
    _positionAnimation = Tween<double>(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)),
    );

    _sizeAnimation = Tween<double>(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.75, curve: Curves.elasticInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          // STEP 01) animation:
          // - When this Animation changes
          // - it will "redraw" the "builder widget"
          // STEP 02) builder Widget:
          // - Widget that will be rebuilt, WHEN animation is triggered/changed
          animation: _positionAnimation,
          builder: (context, animatedBuilderChild) {
            // STEP 03) Re-Rendering:
            // - Only this Container will be redrawed/re-rendered
            return Container(
              width: _sizeAnimation.value,
              margin: EdgeInsets.only(
                top: _positionAnimation.value,
                left: _sizeAnimation.value * 0.25,
              ),
              // - animatedBuilderChild will not be re-rendered
              //   - This will given as child of Container above  taht will be re-rendered
              //   - But, this child given, will not be re-rendered
              child: animatedBuilderChild,
            );
          },
          //This child will not be rebuilt for Animatedbuilder
          child: GestureDetector(
            child: Image.asset(
              'assets/images/balloon.png',
              height: _balloonHeight,
              width: _balloonWidth,
            ),
            onTap: () =>
                _controller.isCompleted ? _controller.reverse() : _controller.forward(),
          ),
        ),
      ),
    );
  }
}