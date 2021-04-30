import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String names;
  final IconData icon;
  final Function onTap;
  final Widget child;
  CustomListTile({this.icon, this.names, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              color: Colors.redAccent,
            ),
          ],
        ),
      ],
    );
  }
}
