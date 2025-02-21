import 'package:flutter/material.dart';
import 'package:mysteriouscoder/core/constants/constants.dart';

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
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout(
      {super.key, required this.mobile, required this.tablet, required this.desktop});

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
          MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      switch (constraints.maxWidth) {
        case < Constants.maxPhoneWidth:
          return mobile;
        case < Constants.maxTabletWidth:
          return tablet;
        default:
          return desktop;
      }
    });
  }
}