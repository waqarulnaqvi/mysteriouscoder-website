import 'package:flutter/material.dart';

import '../../../../shared/styles.dart';

class CommonMainHeading extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? color;
  const CommonMainHeading({super.key, required this.title,this.fontSize =30, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: reusableTextStyle(
          fontSize: fontSize, color: color??Theme.of(context).colorScheme.onSurface),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
