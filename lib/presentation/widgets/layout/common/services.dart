import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/web/services_web.dart';
import '../../../../shared/constants.dart';
import '../mobile/services_mobile.dart';
import 'common_main_heading.dart';
import 'common_sub_heading.dart';

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
          CommonSubHeading(title: Constants.services, w: w,),
          spacerH(40),
          ResponsiveLayout(
              mobile: ServicesMobile(h: 390,),
              tablet: ServicesMobile(),
              desktop: ServicesWeb(w: w, h: h)),
          spacerH(40),
        ],
      ),
    );
  }
}
