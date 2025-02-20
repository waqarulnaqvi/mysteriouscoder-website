import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/website_info_provider.dart';
import '../../service_card.dart';

class ServicesWeb extends StatelessWidget {
  final double w;
  final double h;

  const ServicesWeb({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    var servicesList =
        Provider.of<WebsiteInfoProvider>(context).getServicesList;
    return SizedBox(
      width: w * 0.9,
      child: Center(
        child: Wrap(
          spacing: w * 0.03,
          runSpacing: h * 0.05,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: servicesList
              .asMap()
              .entries
              .map(
                (e) => ServiceCard(service: e.value, h: 350),
              )
              .toList(),
        ),
      ),
    );
  }
}
