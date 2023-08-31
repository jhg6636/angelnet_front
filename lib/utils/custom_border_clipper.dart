import 'package:flutter/cupertino.dart';

class CustomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..moveTo(0.0, 5.0)
      ..quadraticBezierTo(0.0, 0.0, 5.0, 0.0)
      ..lineTo(size.width - 5.0, 0.0)
      ..quadraticBezierTo(size.width, 0.0, size.width, 5.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}