import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:mysteriouscoder/presentation/widgets/animation/entrance_fader.dart';
import 'package:mysteriouscoder/presentation/widgets/privacy_policy_description.dart';
import 'package:provider/provider.dart';
import '../../core/constants/constants.dart';
import '../../core/constants/static_assets.dart';
import '../../core/styles.dart';
import '../widgets/common_main_heading.dart';
import '../widgets/global_widgets.dart';
import '../widgets/theme_controller.dart';
import '../widgets/animation/zoom_animation.dart';

class PrivacyPolicy extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? description;
  final String? returnValue;
  final Color? color;

  const PrivacyPolicy(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.icon,
      this.returnValue = 'mysteriouscoder'});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back), // Back button icon
        //   onPressed: () {
        //     final router = GoRouter.of(context);
        //     if (router.canPop()) {
        //       router.pop(); // Ensures GoRouter handles the back press// Prevents default system back behavior
        //     }
        //    context.go('/');
        //   },
        // ),
        title: Text('Privacy Policy',
            style: reusableTextStyle(
                color: Theme.of(context).colorScheme.surface)),
        actions: [ThemeController(), spacerW()],
      ),
      body: Stack(children: [
        // Background with ColorFiltered
        ColorFiltered(
          colorFilter: provider.mode == ThemeMode.light
              ? ColorFilter.mode(
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                  BlendMode.darken)
              : ColorFilter.mode(Colors.transparent, BlendMode.dst),
          child: Image.asset(
            provider.mode == ThemeMode.dark
                ? StaticAssets.darkTheme
                : StaticAssets.lightTheme,
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
                  icon: icon,
                  color: color,
                ),
              ),
              spacerH(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CommonMainHeading(
                  maxLines: 2,
                  title: title ?? "Mysterious Coder",
                  fontSize: w < Constants.maxPhoneWidth
                      ? 25
                      : (w < Constants.maxTabletWidth ? 30 : 35),
                ),
              ),
              spacerH(),
              PrivacyPolicyDescription(
                  title: description ?? Constants.mysteriousCoderPrivacyPolicy,
                  w: w),
              spacerH(40),
            ],
          ),
        ))
      ]),
    );
  }
}
