import 'package:flutter/material.dart';

import '../main.dart';

class CustomIconsButtons extends StatelessWidget {
  CustomIconsButtons({this.radius, this.iconData, this.onTap});

  final double radius;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Icon(iconData, color: lightGreen),
          onTap: onTap,
        ),
      ),
    );
  }
}
