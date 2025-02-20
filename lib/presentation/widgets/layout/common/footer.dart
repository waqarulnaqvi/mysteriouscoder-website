import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../global_widgets.dart';

class Footer extends StatelessWidget {
  final double w;
  final double h;
  final VoidCallback serviceTap;
  final VoidCallback aboutUsTap;

  const Footer(
      {super.key,
      required this.w,
      required this.h,
      required this.serviceTap,
      required this.aboutUsTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacerH(),
        Container(
          width: w,
          padding: const EdgeInsets.all(20),
          color: Colors.black,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              InkWell(
                onTap: () {
                  context.go('/privacypolicy');
                },
                child: Text(
                  "Privacy Policy",
                  style: footerTextStyle,
                ),
              ),
              InkWell(
                onTap: aboutUsTap,
                child: Text(
                  "About Us",
                  style: footerTextStyle,
                ),
              ),
              InkWell(
                onTap: serviceTap,
                child: Text(
                  "Service",
                  style: footerTextStyle,
                ),
              ),
              Text(
                "© 2025 | Mysterious Coder",
                style: footerTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextStyle footerTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Poppins',
);
