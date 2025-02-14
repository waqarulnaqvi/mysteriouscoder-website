import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_sub_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/mobile/projects_mobile.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/web/projects_web.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import '../../../pages/responsive_layout.dart';
import 'common_main_heading.dart';

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
        CommonSubHeading(title: Constants.services, w: w),
        spacerH(40),
        ResponsiveLayout(
          mobile: ProjectsMobile(h: h*1.4),
          tablet: ProjectsMobile(h:h*1.2),
          desktop: ProjectsWeb(h: h,w: w,)
        ),
        spacerH(40),
      ],
    );
  }
}
