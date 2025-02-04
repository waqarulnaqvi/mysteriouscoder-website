import 'package:flutter/material.dart';
import '../responsive_layout.dart';
import 'home_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: HomeMobile(),
        tabletLayout: Placeholder(),
        desktopLayout: HomeMobile());
  }
}
