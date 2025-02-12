import 'package:flutter/material.dart';
import 'package:mysteriouscoder/domain/data/projects_info.dart';

import '../../../pages/responsive_layout.dart';

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
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    ProjectInfo pi = widget.projectInfo;

    return SizedBox(
      width: ResponsiveLayout.isTablet(context) ? 500 : 350,
      height: widget.h,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none, // Allow overflow
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Card(
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 25),
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: pi.linearGradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                  ],
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
}
