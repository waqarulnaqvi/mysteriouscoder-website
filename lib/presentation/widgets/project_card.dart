import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysteriouscoder/presentation/models/projects_info.dart';
import 'package:mysteriouscoder/core/styles.dart';
import '../../core/constants.dart';
import '../pages/responsive_layout.dart';
import 'global_widgets.dart';

class ProjectCard extends StatefulWidget {
  final ProjectInfo projectInfo;
  final double? h;
  final bool isSelected;

  const ProjectCard(
      {super.key, this.isSelected = false, this.h, required this.projectInfo});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    ProjectInfo pi = widget.projectInfo;

    return SizedBox(
      width: ResponsiveLayout.isTablet(context) ? 500 : 380,
      // height: 1000,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none, // Allow overflow
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              onHover: w > Constants.maxTabletWidth
                  ? (hovering) {
                      if (hovering) {
                        setState(() => isHover = true);
                      } else {
                        setState(() => isHover = false);
                      }
                    }
                  : null,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: pi.linearGradient,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 25),
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: (w > Constants.maxTabletWidth
                              ? isHover
                              : widget.isSelected)
                          ? pi.linearGradient
                          : LinearGradient(colors: [
                              Theme.of(context).colorScheme.surface,
                              Theme.of(context).colorScheme.surface
                            ]),
                      boxShadow: (w > Constants.maxTabletWidth
                              ? isHover
                              : widget.isSelected)
                          ? [primaryColorShadow]
                          : [blackColorShadow],
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        spacerH(60),
                        Center(
                          child: Text(pi.name,
                              textAlign: TextAlign.center,
                              style: commonTextStyle(w, isHover,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700)),
                        ),
                        spacerH(),
                        Container(
                          width: w,
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: pi.linearGradient,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: AssetImage(pi.mainImage),
                              width: w,
                            ),
                          ),
                        ),
                        spacerH(),
                        Text(
                          pi.description,
                          textAlign: TextAlign.center,
                          style: commonTextStyle(
                            w, isHover,
                            fontWeight: FontWeight.w200,
                            fontSize: 13,
                            // color: whiteColor.withValues(alpha: 0.8)
                          ),
                        ),
                        spacerH(),
                        ReusableChipButton(
                          text: "Privacy Policy",
                          icon: Icons.privacy_tip,
                          isImage: false,
                          onTap: () {
                            Navigator.pushNamed(context, '/privacy_policy/${pi.routeName}',
                                arguments: PrivacyPolicyData(
                                    image: pi.privacyPolicyData!.image,
                                    title: pi.privacyPolicyData!.title));
                          },
                        ),
                        spacerH(),
                        Text(
                          "Platform Used:",
                          textAlign: TextAlign.start,
                          style: commonTextStyle(
                            w, isHover,
                            fontWeight: FontWeight.w200,
                            fontSize: 13,
                            // color: whiteColor.withValues(alpha: 0.8)
                          ),
                        ),
                        spacerH(),
                        Wrap(
                            spacing: 10.0,
                            runSpacing: 20.0,
                            alignment: WrapAlignment.spaceEvenly,
                            children: pi.platformUsed
                                .map((e) => ReusableChipButton(
                                    text: e.name, icon: e.icon))
                                .toList()),
                        spacerH(),
                        Text(
                          "Available on:",
                          textAlign: TextAlign.start,
                          style: commonTextStyle(
                            w, isHover,
                            fontWeight: FontWeight.w200,
                            fontSize: 13,
                            // color: whiteColor.withValues(alpha: 0.8)
                          ),
                        ),
                        spacerH(),
                        Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            alignment: WrapAlignment.spaceAround,
                            children: pi.availableOn
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      HapticFeedback.vibrate();
                                      openUrl(e.url);
                                    },
                                    child: Chip(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      label: Text(
                                        e.name,
                                        style: reusableTextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                      avatar: e.type == IconType.iconData
                                          ? Icon(e.icon, color: Colors.white)
                                          : Image(
                                              image: e.icon,
                                              color: Colors.white,
                                            ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            width: 1.0,
                                          )),
                                    ),
                                  ),
                                )
                                .toList())
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            // Adjust this value to give enough space for the CircleAvatar
            child: Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                gradient: pi.linearGradient,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(pi.icon),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle commonTextStyle(double w, bool isHover,
      {double? fontSize,
      FontWeight? fontWeight,
      String fontFamily = 'Poppins'}) {
    return TextStyle(
        color: (w > Constants.maxTabletWidth ? isHover : widget.isSelected)
            ? Colors.white
            : Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Poppins');
  }
}

class ReusableChipButton extends StatefulWidget {
  final String text;
  final dynamic icon;
  final VoidCallback? onTap;
  final bool isImage;

  const ReusableChipButton(
      {super.key,
      required this.text,
      required this.icon,
      this.onTap,
      this.isImage = true});

  @override
  State<ReusableChipButton> createState() => _ReusableChipButtonState();
}

class _ReusableChipButtonState extends State<ReusableChipButton> {
  static const _animationPadding =
      EdgeInsets.symmetric(vertical: 2, horizontal: 2);
  static const _withoutAnimationPadding =
      EdgeInsets.symmetric(vertical: 0, horizontal: 0);
  EdgeInsets _currentPadding = _withoutAnimationPadding;
  bool _isHover = false;

  void onTap() {
    setState(() {
      _currentPadding = _animationPadding;
    });
    if (!_isHover) {
      Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          _currentPadding = _withoutAnimationPadding;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hovering) {
        _isHover = hovering;
        setState(() {
          _currentPadding =
              _isHover ? _animationPadding : _withoutAnimationPadding;
        });
      },
      onTap: () {
        HapticFeedback.vibrate();
        onTap();
        widget.onTap?.call();
      },
      child: Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: AnimatedPadding(
          curve: Curves.easeInOut,
          padding: _currentPadding,
          duration: const Duration(milliseconds: 1000),
          child: Text(
            widget.text,
            style: reusableTextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 13),
          ),
        ),
        avatar: widget.isImage
            ? Image.asset(widget.icon)
            : Icon(
                widget.icon,
              ),
        shape: StadiumBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

//Old Platform used code
// .map((e) => InkWell(
//       onTap: () {
//         HapticFeedback.vibrate();
//       },
//       child: Chip(
//         padding: const EdgeInsets.symmetric(
//             vertical: 10.0, horizontal: 10.0),
//         label: Text(
//           e.name,
//           style: reusableTextStyle(
//               color: Theme.of(context)
//                   .colorScheme
//                   .onSurface,
//               fontSize: 13),
//         ),
//         avatar: Image.asset(e.icon),
//         shape: StadiumBorder(
//           side: BorderSide(
//             color: Theme.of(context)
//                 .colorScheme
//                 .onSurface,
//             width: 1.0,
//           ),
//         ),
//       ),
//     ))

//Old Privacy Policy code
//                     InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PrivacyPolicy(
//                                           title: pi.privacyPolicyData!.title,
//                                           icon: pi.privacyPolicyData!.image,
//                                         )));
//                           },
//                           child: Chip(
//                             label: Text(
//                               "Privacy Policy",
//                               style: reusableTextStyle(
//                                   color:
//                                       Theme.of(context).colorScheme.onSurface,
//                                   fontSize: 13),
//                             ),
//                             avatar: const Icon(Icons.privacy_tip),
//                             shape: StadiumBorder(
//                               side: BorderSide(
//                                 color: Theme.of(context).colorScheme.onSurface,
//                                 width: 1.0,
//                               ),
//                             ),
//                           ),
//                         ),
