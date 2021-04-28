import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color myColor;
  final Widget child;
  final Function onPress;

  MyContainer({this.myColor, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      ),
    );
  }
}
