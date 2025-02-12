import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_main_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_sub_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:provider/provider.dart';
import '../../shared/provider/theme_provider.dart';
import '../../shared/styles.dart';
import '../widgets/entrance_fader.dart';
import '../widgets/static_image.dart';
import '../widgets/theme_controller.dart';
import '../widgets/zoom_animation.dart';

class PrivacyPolicy extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? description;
  const PrivacyPolicy({super.key, this.title, this.description, this.icon});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: true,
        title: Text('Privacy Policy',
            style:
            reusableTextStyle(color: Theme.of(context).colorScheme.surface)),
        actions: [
          ThemeController(),
          spacerW()
        ],
      ),

    body: Stack(
    children: [
    // Background with ColorFiltered
    ColorFiltered(
    colorFilter: provider.mode == ThemeMode.light
    ? ColorFilter.mode(
    Theme.of(context)
        .colorScheme
        .primary
        .withValues(alpha: 0.2),
    BlendMode.darken)
        : ColorFilter.mode(Colors.transparent, BlendMode.dst),
    child: Image.asset(
    provider.mode == ThemeMode.dark
    ? StaticImage.darkTheme
        : StaticImage.lightTheme,
    fit: BoxFit.cover,
    width: w,
    height: h,
    ),
    ),

    // Foreground Content (Column)
    SingleChildScrollView(
    child: SizedBox(
      width: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        spacerH(),
       EntranceFader(
          offset: Offset(0, 0),
          delay: Duration(seconds: 1),
          duration: Duration(milliseconds: 800),
          child: ZoomAnimations(
            icon: icon
          ),
        ),
        spacerH(10),
        CommonMainHeading(title:title??"Mysterious Coder" ,fontSize: 35,),
        spacerH(),
       CommonDescriptionPrivacyPolicy(title: description?? Constants.mysteriousCoderPrivacyPolicy, w: w),
        spacerH(40),

      ],
      ),
    ))
    ]
    ),
    );
  }
}
