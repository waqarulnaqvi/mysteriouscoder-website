import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../pages/responsive_layout.dart';
import '../../common_description.dart';
import '../../common_main_heading.dart';
import '../../global_widgets.dart';
import '../mobile/services_mobile.dart';
import '../web/services_web.dart';

class Services extends StatelessWidget {
  final double w;
  final double h;

  const Services({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spacerH(),
          CommonMainHeading(title: "Services"),
          spacerH(15),
          SizedBox(
            width: w < Constants.maxTabletWidth ? w * 0.9 : w * 0.8,
            child: CommonDescription(
              text: Constants.servicesDescription,
            ),
          ),
          spacerH(40),
          ResponsiveLayout(
              mobile: ServicesMobile(
                w: w,
                h: 390,
              ),
              tablet: ServicesMobile(
                w: w,
              ),
              desktop: ServicesWeb(w: w, h: h)),
          spacerH(40),
        ],
      ),
    );
  }
}
