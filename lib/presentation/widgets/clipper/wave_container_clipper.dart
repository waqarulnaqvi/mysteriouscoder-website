import 'package:flutter/material.dart';

class WaveContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top-left corner
    path.moveTo(0, 50);

    // Create the wave at the top
    path.quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, 30);
    path.quadraticBezierTo(size.width * 0.75, 60, size.width, 20);

    // Move to bottom-right corner
    path.lineTo(size.width, size.height - 20);

    // Create the wave at the bottom
    path.quadraticBezierTo(size.width * 0.75, size.height + 20, size.width * 0.5, size.height - 10);
    path.quadraticBezierTo(size.width * 0.25, size.height - 40, 0, size.height);

    // Close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
