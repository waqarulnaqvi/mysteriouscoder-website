import 'package:flutter/material.dart';

/*
  ResponsiveLayout is a widget that allows you to build different layouts for different screen sizes.
  It takes three required parameters: mobileLayout, tabletLayout, and desktopLayout.
  The LayoutBuilder widget is used to determine the screen size and return the appropriate layout.
  The constraints.maxWidth property is used to determine the screen size.
  The switch statement is used to return the appropriate layout based on the screen size.

  Usage: For any new page/screen, you have to use this widget to build different layouts for different screen sizes.
  Focus on mobileLayout and put Placeholder() widgets in tabletLayout and desktopLayout for now.

  Example:

  class ProfilePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return ResponsiveLayout(
        mobileLayout: ProfileMobileLayout(), // put in lib/features/profile/presentation/pages/profile_mobile_layout.dart
        tabletLayout: Placeholder(),
        desktopLayout: Placeholder(),
      );
    }
  }
*/

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout(
      {super.key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      switch (constraints.maxWidth) {
        case < 600:
          return mobileLayout;
        case < 1200:
          return tabletLayout;
        default:
          return desktopLayout;
      }
    });
  }
}