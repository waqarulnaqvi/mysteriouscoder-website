import 'package:flutter/material.dart';

import '../../core/styles.dart';

class CommonMainHeading extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? color;
  final int maxLines;
  const CommonMainHeading({super.key, required this.title,this.fontSize =30, this.color, this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: reusableTextStyle(
          fontSize: fontSize, color: color??Theme.of(context).colorScheme.onSurface),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: TextAlign.center,

    );
  }
}
