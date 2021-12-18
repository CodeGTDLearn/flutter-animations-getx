### Project Index

**1. TabBar Widget**


**2. _Built-in Animations_**
+ _StatelessWidgets + GetX_:
  - AnimatedCrossFade
  - AnimatedOpacity
  - AnimatedPositioned
  - AnimatedIcons
  - AnimatedContainer
    - curve + transform
    - size


**3. _Custom Animations_**
+ 3.1 _StatefulWidgets + AnimationController_:
  - ControllerFade: CurvedAnimation + addStatusListener.reverse
  - ControllerFlip: Tween(double) + AnimationStatus.dismissed
  - ControllerSlide: Tween(Offset) + addStatusListener.repeat3. 


+ 3.2 _StatefulWidgets + AnimationController + AnimatedBuilder_:
  - ControllerBounce: CurvedAnimation + addStatusListener.repeat
  - ControllerMultiple: Tween(double) + Interval + _controller.isCompleted
    - Complete Explanation of AnimatedBuilder
  - ControllerResize: Tween(Size) + addStatusListener.repeat