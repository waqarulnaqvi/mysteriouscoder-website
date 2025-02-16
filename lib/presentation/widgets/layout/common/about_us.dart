import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../common_main_heading.dart';
import '../../common_sub_heading.dart';
import '../../global_widgets.dart';

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
        CommonSubHeading(
          title: Constants.aboutUs,
          w: w,
        ),
        spacerH(40),
      ],
    );
  }
}
