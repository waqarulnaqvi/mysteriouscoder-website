import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysteriouscoder/core/constants/constants.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class CommonDescription extends StatefulWidget {
  final TextAlign textAlign;
  final String text;

  const CommonDescription({super.key, this.textAlign = TextAlign.center,this.text= Constants.description});

  @override
  State<CommonDescription> createState() => _CommonDescriptionState();
}

class _CommonDescriptionState extends State<CommonDescription> {
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
        decoration: BoxDecoration(
          color: ((isHover == true && provider == ThemeMode.light) ||
              isColorChanged)
              ? Colors.white
              : Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: AnimatedPadding(
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(provider == ThemeMode.light ? 20 : 0),
          duration: const Duration(milliseconds: 1000),
          child: Text(
            widget.text
            // "**Mysterious Coder** – Flutter Development Services\n\n"
            //     "🚀 Mobile & Web App Development – High-quality solutions for Android, iOS, and web.\n\n"
            // "🎨 Custom UI/UX Design – Smooth, user-friendly, and engaging interfaces.\n\n"
            // "⚡ Fast & Scalable Apps – Optimized performance with clean, maintainable code.\n\n"
            // "🔗 Seamless API Integration – Connecting your app with third-party services.\n\n"
            // "🛠 Cross-Platform Efficiency – One codebase for multiple platforms.\n\n"
            // "💼 Freelancing Solutions – Tailored services to meet your business needs.\n\n"
            // "🔄 Maintenance & Support – Reliable post-launch updates and fixes.\n\n"
            // "✨ Turning Ideas into Reality – Let’s build something amazing with Flutter!\n"
            ,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
            textAlign: widget.textAlign,
          ),
        ),
      ),
    );
  }
}

//class CommonSubHeading extends StatefulWidget {
//   final double w;
//   final String title;
//   final TextAlign? align;
//
//   const CommonSubHeading(
//       {super.key, required this.title, required this.w, this.align});
//
//   @override
//   State<CommonSubHeading> createState() => _CommonSubHeadingState();
// }
//
// class _CommonSubHeadingState extends State<CommonSubHeading> {
//   bool isHover = false;
//   bool isColorChanged = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<ThemeProvider>(context).mode;
//
//     return InkWell(
//       onTap: provider == ThemeMode.light
//           ? () {
//               setState(() {
//                 HapticFeedback.vibrate();
//                 isColorChanged = true;
//               });
//               Future.delayed(const Duration(milliseconds: 500), () {
//                 if (mounted) {
//                   setState(() {
//                     isColorChanged = false;
//                   });
//                 }
//               });
//             }
//           : null,
//       onHover: (hovering) {
//         setState(() {
//           isHover = hovering;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: ((isHover == true && provider == ThemeMode.light) ||
//                   isColorChanged)
//               ? Colors.white
//               : Theme.of(context).colorScheme.onTertiary,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         width: widget.w < Constants.maxTabletWidth
//             ? widget.w * 0.9
//             : widget.w * 0.8,
//         child: Text(
//           widget.title,
//           style: TextStyle(
//               fontFamily: 'Poppins',
//               fontSize: 16,
//               color: Theme.of(context).colorScheme.onSurface),
//           textAlign: widget.align ?? TextAlign.center,
//         ),
//       ),
//     );
//   }
// }