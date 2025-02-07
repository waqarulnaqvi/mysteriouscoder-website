import 'package:flutter/material.dart';

class WaveContainerClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top-left corner
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20);

    // Create a stylish cutting wave at the bottom
    path.quadraticBezierTo(size.width * 0.75, size.height - 50, size.width * 0.5, size.height - 20);
    path.quadraticBezierTo(size.width * 0.25, size.height + 10, 0, size.height - 20);

    // Close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
