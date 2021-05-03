import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double width;
  final double height;
  final Color color1;
  final Color color2;
  final Widget child;
  final BoxBorder boxBorder;
  final List<BoxShadow> boxShadow;
  Circle(
      {this.boxBorder,
      this.boxShadow,
      this.child,
      this.color1,
      this.color2,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(70.0),
      width: width,
      height: height,
      margin: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        shape: BoxShape.circle,
        border: boxBorder,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
