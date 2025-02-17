import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants.dart';


class PrivacyPolicyDescription extends StatefulWidget {
  final double w;
  final String title;
  final TextAlign? align;

  const PrivacyPolicyDescription(
      {super.key, required this.title, required this.w, this.align});

  @override
  State<PrivacyPolicyDescription> createState() =>
      _PrivacyPolicyDescriptionState();
}

class _PrivacyPolicyDescriptionState
    extends State<PrivacyPolicyDescription> {
  bool isHover = false;
  bool isColorChanged = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          HapticFeedback.vibrate();
          isColorChanged = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              isColorChanged = false;
            });
          }
        });
      },
      onHover: (hovering) {
        setState(() {
          isHover = hovering;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: (isHover || isColorChanged)
              ? Theme.of(context).colorScheme.tertiary
              : Theme.of(context).colorScheme.onTertiary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        width: widget.w < Constants.maxTabletWidth
            ? widget.w * 0.9
            : widget.w * 0.8,
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'Poppins',
          ),
          textAlign: widget.align ?? TextAlign.start,
        ),
      ),
    );
  }
}
