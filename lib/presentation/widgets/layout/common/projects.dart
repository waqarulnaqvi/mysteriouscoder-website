import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_sub_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/shared/constants.dart';

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
        CommonSubHeading(title: Constants.whatICanDO, w: w),
        spacerH(40),

      ],
    );
  }
}
