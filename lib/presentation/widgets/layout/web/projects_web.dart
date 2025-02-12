import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/project_card.dart';

import '../../../../domain/data/projects_info.dart';

class ProjectsWeb extends StatelessWidget {
  final double h;
  final double w;
  const ProjectsWeb({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: w * 0.03,
        runSpacing: h * 0.05,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: projectInfoList.asMap().entries.map((e) => ProjectCard(projectInfo: e.value,h: 350,)).toList());
  }
}
