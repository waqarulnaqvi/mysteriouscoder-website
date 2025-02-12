import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_main_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_sub_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:mysteriouscoder/shared/styles.dart';

import '../../entrance_fader.dart';
import '../../zoom_animation.dart';

class AboutUs extends StatelessWidget {
  final double w;
  const AboutUs({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spacerH(),
          CommonMainHeading(title: "About Us"),
          spacerH(15),
          CommonSubHeading(title: Constants.aboutUs, w: w,),
          spacerH(40),
        ],
    );
  }
}
