import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_main_heading.dart';

class ContactUs extends StatelessWidget {
  final double w;
  final double h;
  const ContactUs({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonMainHeading(title: "Contact Us"),
      ],
    );
  }
}
