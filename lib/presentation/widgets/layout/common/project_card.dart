import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysteriouscoder/domain/data/projects_info.dart';
import 'package:mysteriouscoder/presentation/pages/privacy_policy.dart';
import 'package:mysteriouscoder/shared/styles.dart';

import '../../../../shared/constants.dart';
import '../../../pages/responsive_layout.dart';
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
      width: ResponsiveLayout.isTablet(context) ? 500 : 350,
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
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spacerH(60),

                        Center(
                          child: Text(pi.name,
                              textAlign: TextAlign.center,
                              style: commonTextStyle(w, isHover)),
                        ),

                        spacerH(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Available on: ",
                                textAlign: TextAlign.center,
                                style: commonTextStyle(w, isHover)),
                            InkWell(
                              onTap: () {
                                openUrl(pi.playStoreLink!);
                              },
                              child: Icon(
                                FontAwesomeIcons.googlePlay,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 15,
                              ),
                            ),
                          ],
                        ),

                        spacerH(),

                        Container(
                          width: w,
                          margin: const EdgeInsets.only(left: 10, right: 10),
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrivacyPolicy(
                                          title: pi.privacyPolicyData!.title,
                                          icon: pi.privacyPolicyData!.image,
                                        )));
                          },
                          child: Chip(
                            label: Text(
                              "Privacy Policy",
                              style: reusableTextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 13),
                            ),
                            avatar: const Icon(Icons.privacy_tip),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.onSurface,
                                width: 1.0,
                              ),
                            ),
                          ),
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

                        // Wrap(
                        //   children: pi.platformUsed.
                        // ),
                        spacerH(),
                        Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: pi.platformUsed
                                .map((e) => Chip(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
                                      label: Text(
                                        e.name,
                                        style: reusableTextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            fontSize: 13),
                                      ),
                                      avatar: Image.asset(e.icon),
                                      shape: StadiumBorder(
                                        side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))
                                .toList()),
                        spacerH(),
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
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
      {double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        color: (w > Constants.maxTabletWidth ? isHover : widget.isSelected)
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }
}
