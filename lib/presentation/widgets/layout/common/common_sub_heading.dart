import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/provider/theme_provider.dart';

class CommonSubHeading extends StatefulWidget {
  final double w;
  final String title;
  const CommonSubHeading({super.key, required this.title, required this.w});

  @override
  State<CommonSubHeading> createState() => _CommonSubHeadingState();
}

class _CommonSubHeadingState extends State<CommonSubHeading> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ThemeProvider>(context).mode;

    return InkWell(
      onTap: (){},
      onHover: (hovering) {
        setState(() {
          isHover = hovering;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: (isHover==true && provider==ThemeMode.light  )?Colors.white:  Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(15),
        ),
        width: widget.w < Constants.maxTabletWidth ? widget.w * 0.9 : widget.w * 0.8,
        child:Text(
          widget.title,
          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
