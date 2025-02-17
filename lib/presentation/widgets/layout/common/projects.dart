import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../../pages/responsive_layout.dart';
import '../../common_description.dart';
import '../../common_main_heading.dart';
import '../../global_widgets.dart';
import '../mobile/projects_mobile.dart';
import '../web/projects_web.dart';

class Projects extends StatelessWidget {
  final double w;
  final double h;

  const Projects({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        spacerH(),
        CommonMainHeading(title: "Projects"),
        spacerH(15),
        SizedBox(
          width: w < Constants.maxTabletWidth ? w * 0.9 : w * 0.8,
          child: CommonDescription(
            text: Constants.projectsDescription,
          ),
        ),
        spacerH(40),
        ResponsiveLayout(
            mobile: ProjectsMobile(
              h: h * 1.3,
              w: w,
            ),
            tablet: ProjectsMobile(
              h: h * 1.2,
              w: w,
            ),
            desktop: ProjectsWeb(
              h: h,
              w: w,
            )),
        spacerH(40),
      ],
    );
  }
}
