import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  const ScaleAnimation({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.ease,
      tween: Tween<double>(begin: .6, end: 1),
      duration: Duration(milliseconds: 300),
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
      child: child,
    );
  }
}
