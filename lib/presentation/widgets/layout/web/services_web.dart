import 'package:flutter/material.dart';
import 'package:mysteriouscoder/domain/data/services_utils.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/service_card.dart';

class ServicesWeb extends StatelessWidget {
  const ServicesWeb({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Wrap(
      spacing: w * 0.03,
      runSpacing: h * 0.05,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: servicesUtils
          .asMap()
          .entries
          .map(
            (e) => ServiceCard(service: e.value, h: 350),
          )
          .toList(),
    );
  }
}
