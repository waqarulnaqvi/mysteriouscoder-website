import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class CommonSubHeading extends StatelessWidget {
  final double w;
  final String title;
  const CommonSubHeading({super.key, required this.title, required this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w < Constants.maxTabletWidth ? w * 0.9 : w * 0.8,
      child:Text(
        title,
        style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
        textAlign: TextAlign.center,
      ),
    );
  }
}
