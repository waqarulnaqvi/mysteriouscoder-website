import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/common_description.dart';
import '../../../../core/constants.dart';
import '../../common_main_heading.dart';
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
        SizedBox(
          width: w < Constants.maxTabletWidth
              ? w * 0.9
              : w * 0.8,
          child: CommonDescription(
            text: Constants.aboutUsDescription,
          ),
        ),
        spacerH(40),
      ],
    );
  }
}
