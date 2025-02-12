import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/provider/theme_provider.dart';

class CommonSubHeading extends StatefulWidget {
  final double w;
  final String title;
  final TextAlign? align;

  const CommonSubHeading(
      {super.key, required this.title, required this.w, this.align});

  @override
  State<CommonSubHeading> createState() => _CommonSubHeadingState();
}

class _CommonSubHeadingState extends State<CommonSubHeading> {
  bool isHover = false;
  bool isColorChanged = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context).mode;

    return InkWell(
      onTap: provider == ThemeMode.light
          ? () {
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
            }
          : null,
      onHover: (hovering) {
        setState(() {
          isHover = hovering;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ((isHover == true && provider == ThemeMode.light) ||
                  isColorChanged)
              ? Colors.white
              : Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(15),
        ),
        width: widget.w < Constants.maxTabletWidth
            ? widget.w * 0.9
            : widget.w * 0.8,
        child: Text(
          widget.title,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface),
          textAlign: widget.align ?? TextAlign.center,
        ),
      ),
    );
  }
}

class CommonDescriptionPrivacyPolicy extends StatefulWidget {
  final double w;
  final String title;
  final TextAlign? align;

  const CommonDescriptionPrivacyPolicy(
      {super.key, required this.title, required this.w, this.align});

  @override
  State<CommonDescriptionPrivacyPolicy> createState() =>
      _CommonDescriptionPrivacyPolicyState();
}

class _CommonDescriptionPrivacyPolicyState
    extends State<CommonDescriptionPrivacyPolicy> {
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
