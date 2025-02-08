import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/web/services_web.dart';
import '../../../../shared/constants.dart';
import '../mobile/services_mobile.dart';

class Services extends StatelessWidget {
  final double w;
  final double h;

  const Services({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).colorScheme.onPrimary,
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spacerH(),
          Text(
            "What I can do?",
            style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.onSurface),
          ),
          spacerH(15),
          SizedBox(
            width: w < Constants.maxTabletWidth ? w * 0.9 : w * 0.8,
            child:Text(
              Constants.whatICanDO,
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
          ),
          spacerH(40),
          const ResponsiveLayout(
              mobile: ServicesMobile(),
              tablet: ServicesMobile(),
              desktop: ServicesWeb()),
          spacerH(40),
        ],
      ),
    );
  }
}
