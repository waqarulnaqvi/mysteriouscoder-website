import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/styles.dart';

class ColorChangeButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final double w;
  final double h;
  final double fontSize;

  const ColorChangeButton(
      {super.key,
      this.text = "Get in Touch",
      required this.onTap,
      this.w = 200,
      this.h = 50,
      this.fontSize = 16});

  @override
  State<ColorChangeButton> createState() => _ColorChangeButtonState();
}

class _ColorChangeButtonState extends State<ColorChangeButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;
  Timer? time;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    time?.cancel();
    time = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if(isHover==false) {
        _animatedWidth = 0.0;
      }
      isPressed = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    time?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isHover)
          Container(
            height: widget.h,
            width: widget.w,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface, width: 1.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: widget.h,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: themeGradient,
          ),
        ),
        // MouseRegion(
        //   onEnter: (_) => setState(() {
        //     isHover = true;
        //     _animatedWidth = widget.w;
        //   }),
        //   onExit: (_) => setState(() {
        //     isHover = false;
        //     if (!isPressed) _animatedWidth = 0.0;
        //   }),
        //   child:
          InkWell(
            onHover: (hovering) {
              setState(() {
                isHover = hovering;
                _animatedWidth = hovering || isPressed ? widget.w : 0.0;
              });
            },
            onTap: () {
              setState(() {
                isPressed = true;
                _animatedWidth = widget.w;
              });
              widget.onTap();
              startTimer();
            },
            child: SizedBox(
              height: widget.h,
              width: widget.w,
              child: Center(
                child: Text(
                  widget.text.toUpperCase(),
                  style: TextStyle(
                    color: (isHover || isPressed)
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onSurface,
                    fontSize: widget.fontSize,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        // )
      ],
    );
  }
}

// return ResponsiveLayout(
//   desktop: DesktopCCButton(text: text, onTap: onTap),
//   tablet: TabCCButton(text: text, onTap: onTap),
//   mobile: MobileCCButton(text: text, onTap: onTap),
// );
// class MobileCCButton extends StatefulWidget {
//   final String text;
//   final Function() onTap;
//
//   const MobileCCButton({Key? key, required this.text, required this.onTap})
//       : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _MobileCCButtonState createState() => _MobileCCButtonState();
// }
//
// class _MobileCCButtonState extends State<MobileCCButton> {
//   double _animatedWidth = 0.0;
//   bool isHover = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // theme
//     var theme = Theme.of(context);
//
//     return Stack(
//       children: [
//         if (!isHover)
//           Container(
//             height: 35,
//             width: 125,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: Theme.of(context).colorScheme.onSurface, width: 1.5),
//               borderRadius: BorderRadius.circular(3),
//             ),
//           ),
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           height: 35,
//           width: _animatedWidth,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(3),
//             gradient: themeGradient,
//           ),
//         ),
//         InkWell(
//           onHover: (value) {
//             setState(() {
//               isHover = !isHover;
//               _animatedWidth = value ? 125 : 0.0;
//             });
//           },
//           onTap: () {
//             setState(() => _animatedWidth = 125);
//             widget.onTap();
//           },
//           child: SizedBox(
//             height: 35,
//             width: 125,
//             child: Center(
//               child: Text(
//                 widget.text.toUpperCase(),
//                 style: TextStyle(
//                   color: isHover
//                       ? Colors.white
//                       : Theme.of(context).colorScheme.onSurface,
//                   fontSize: 13,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class TabCCButton extends StatefulWidget {
//   final String text;
//   final Function() onTap;
//
//   const TabCCButton({
//     Key? key,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _TabCCButtonState createState() => _TabCCButtonState();
// }
//
// class _TabCCButtonState extends State<TabCCButton> {
//   double _animatedWidth = 0.0;
//   bool isHover = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // theme
//     var theme = Theme.of(context);
//
//     return Stack(
//       children: [
//         if (!isHover)
//           Container(
//             height: 50,
//             width: 200,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: Theme.of(context).colorScheme.onSurface, width: 2),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           height: 50,
//           width: _animatedWidth,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             gradient: themeGradient,
//           ),
//         ),
//         InkWell(
//             onHover: (value) {
//               setState(() {
//                 isHover = !isHover;
//                 _animatedWidth = value ? 200 : 0.0;
//               });
//             },
//             onTap: () {
//               setState(() => _animatedWidth = 200);
//               widget.onTap();
//             },
//             child: SizedBox(
//               height: 50,
//               width: 200,
//               child: Center(
//                 child: Text(
//                   widget.text.toUpperCase(),
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onSurface,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             )),
//       ],
//     );
//   }
// }
//
// class DesktopCCButton extends StatefulWidget {
//   final String text;
//   final Function() onTap;
//
//   const DesktopCCButton({
//     Key? key,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _DesktopCCButtonState createState() => _DesktopCCButtonState();
// }
//
// class _DesktopCCButtonState extends State<DesktopCCButton> {
//   double _animatedWidth = 0.0;
//   bool isHover = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return Stack(
//       children: [
//         if (!isHover)
//           Container(
//             height: 65,
//             width: 250,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: Theme.of(context).colorScheme.onSurface, width: 3),
//               borderRadius: BorderRadius.circular(6),
//             ),
//           ),
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           height: 65,
//           width: _animatedWidth,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             gradient: themeGradient,
//           ),
//         ),
//         InkWell(
//           onHover: (value) {
//             setState(() {
//               isHover = !isHover;
//               _animatedWidth = value ? 250 : 0.0;
//             });
//           },
//           onTap: () {
//             setState(() => _animatedWidth = 250);
//             widget.onTap();
//           },
//           child: SizedBox(
//             height: 65,
//             width: 250,
//             child: Center(
//               child: Text(
//                 widget.text.toUpperCase(),
//                 style: TextStyle(
//                   color: isHover
//                       ? Colors.white
//                       : Theme.of(context).colorScheme.onSurface,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
