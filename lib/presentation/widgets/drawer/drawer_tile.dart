import 'package:flutter/material.dart';
import 'package:mysteriouscoder/core/styles.dart';

import '../../../core/global.dart';

class DrawerTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;
  const DrawerTile({ required this.icon, required this.title,
    required this.onTap,
    super.key});

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
 bool _isHover=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHighlightChanged: (value){
        setState(() {
          _isHover= !_isHover;
        });
      },
      child: Container(
        color: _isHover? dark.withValues(alpha: 0.4):Colors.transparent ,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(widget.icon,color: _isHover?Theme.of(context).colorScheme.onSurface:Theme.of(context).colorScheme.surface,),
            const SizedBox(width: 15),
            Flexible(child: FittedBox(
              child: Text(widget.title,
                style: reusableTextStyle(fontSize: 14,color: _isHover?Theme.of(context).colorScheme.onSurface:Theme.of(context).colorScheme.surface,
                ),
    ),
            )),
          ],
        ),
      ),
    );
  }
}
