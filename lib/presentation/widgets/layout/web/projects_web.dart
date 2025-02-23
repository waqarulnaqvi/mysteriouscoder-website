import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/card/project_card.dart';
import 'package:provider/provider.dart';
import '../../../providers/website_info_provider.dart';

class ProjectsWeb extends StatelessWidget {
  final double h;
  final double w;
  const ProjectsWeb({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    var projectList= Provider.of<WebsiteInfoProvider>(context,listen: false).getProjectList;

    return SizedBox(
      width:w * 0.9,
      child: Center(
        child: Wrap(
            spacing: w * 0.03,
            runSpacing: h * 0.05,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: projectList.asMap().entries.map((e) => ProjectCard(projectInfo: e.value,h: 350,)).toList()),
      ),
    );
  }
}
