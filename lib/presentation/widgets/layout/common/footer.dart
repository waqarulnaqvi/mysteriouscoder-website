import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';

class Footer extends StatelessWidget {
  final double w;
  final double h;
  const Footer({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacerH(),
        Container(
          width: w,
          height: h * 0.1,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Privacy Policy",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              spacerW(30),
              Text("Service",
                  style: TextStyle(
                    color: Colors.white,
                  )),

              spacerW(30),
              Text(
                "© 2025 | Mysterious Coder",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
