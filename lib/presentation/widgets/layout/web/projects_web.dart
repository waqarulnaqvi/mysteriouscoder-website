

import 'package:flutter/material.dart';

import '../../../models/projects_info.dart';
import '../../project_card.dart';

class ProjectsWeb extends StatelessWidget {
  final double h;
  final double w;
  const ProjectsWeb({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:w * 0.9,
      child: Center(
        child: Wrap(
            spacing: w * 0.03,
            runSpacing: h * 0.05,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: projectInfoList.asMap().entries.map((e) => ProjectCard(projectInfo: e.value,h: 350,)).toList()),
      ),
    );
  }
}
