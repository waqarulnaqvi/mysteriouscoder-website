import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysteriouscoder/domain/data/social_media_icons.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_main_heading.dart';
import 'package:provider/provider.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/provider/theme_provider.dart';
import '../../color_change_button.dart';
import '../../entrance_fader.dart';
import '../../static_image.dart';
import '../../zoom_animation.dart';
import 'global_widgets.dart';

class MainPart extends StatelessWidget {
  final double w;
  final double h;
  final VoidCallback onTap;

  const MainPart(
      {super.key, required this.w, required this.h, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: ResponsiveLayout(
          mobile: mobile(context),
          tablet: mobile(context),
          desktop: web(context)),
    );
  }

  Widget mobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spacerH(),
          const EntranceFader(
            offset: Offset(0, 0),
            delay: Duration(seconds: 1),
            duration: Duration(milliseconds: 800),
            child: ZoomAnimations(),
          ),
          spacerH(10),
          CommonMainHeading(
            title: "Mysterious Coder",
            fontSize: 35,
          ),
          commonSubHeading(context),
          spacerH(),
          CommonDescription(isMobile: true),
          spacerH(),
          CommonSocialMediaPlatforms(),
          spacerH(),
          // w < Constants.maxPhoneWidth?
          // commonButton(context):
          commonButton(context, w: 200, h: 50, fontSize: 16),
          spacerH(40),
        ],
      ),
    );
  }

  Widget web(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacerH(30),
            CommonMainHeading(
              title: "Mysterious Coder",
              fontSize: 35,
            ),
            spacerH(5),
            commonSubHeading(context),
            spacerH(),
            SizedBox(width: w * 0.5, child: CommonDescription()),
            spacerH(),
            SizedBox(
              width: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonSocialMediaPlatforms(),
                  spacerH(),
                  commonButton(context, w: 220, h: 50, fontSize: 16),
                ],
              ),
            ),
            spacerH(40),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: const EntranceFader(
            offset: Offset(0, 0),
            delay: Duration(seconds: 1),
            duration: Duration(milliseconds: 800),
            child: ZoomAnimations(),
          ),
        ),
      ],
    );
  }

  Widget commonSubHeading(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          "Hello there! Stay a while and explore!",
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Theme.of(context).colorScheme.onSurface, fontSize: 18),
          textAlign: TextAlign.center,

        ),
        spacerW(10),
        Image.asset(
          StaticImage.hi,
          height: 35,
        ),
      ],
    );
  }

  Widget commonButton(BuildContext context,
      {double? w, double? h, double? fontSize}) {
    return ColorChangeButton(
      text: "Get in Touch",
      onTap: onTap,
      w: w ?? 160,
      h: h ?? 45,
      fontSize: fontSize ?? 13,
    );
  }
}

class CommonDescription extends StatefulWidget {
  final bool isMobile;

  const CommonDescription({super.key, this.isMobile = false});

  @override
  State<CommonDescription> createState() => _CommonDescriptionState();
}

class _CommonDescriptionState extends State<CommonDescription> {
  bool isHover = false;
  bool isColorChanged = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context).mode;

    return InkWell(
      onTap: provider == ThemeMode.light? () {
        setState(() {
          HapticFeedback.vibrate();
          isColorChanged = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              isColorChanged = false;
            });
          }
        });
      } :null ,
      onHover: (hovering) {
        setState(() {
          isHover = hovering;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ((isHover == true && provider == ThemeMode.light) ||
                  isColorChanged)
              ? Colors.white
              : Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          Constants.description
          // "**Mysterious Coder** – Flutter Development Services\n\n"
          //     "🚀 Mobile & Web App Development – High-quality solutions for Android, iOS, and web.\n\n"
          // "🎨 Custom UI/UX Design – Smooth, user-friendly, and engaging interfaces.\n\n"
          // "⚡ Fast & Scalable Apps – Optimized performance with clean, maintainable code.\n\n"
          // "🔗 Seamless API Integration – Connecting your app with third-party services.\n\n"
          // "🛠 Cross-Platform Efficiency – One codebase for multiple platforms.\n\n"
          // "💼 Freelancing Solutions – Tailored services to meet your business needs.\n\n"
          // "🔄 Maintenance & Support – Reliable post-launch updates and fixes.\n\n"
          // "✨ Turning Ideas into Reality – Let’s build something amazing with Flutter!\n"
          ,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
          textAlign: widget.isMobile ? TextAlign.center : TextAlign.start,
        ),
      ),
    );
  }
}

class CommonSocialMediaPlatforms extends StatefulWidget {
  const CommonSocialMediaPlatforms({super.key});

  @override
  State<CommonSocialMediaPlatforms> createState() =>
      _CommonSocialMediaPlatformsState();
}

class _CommonSocialMediaPlatformsState
    extends State<CommonSocialMediaPlatforms> {
  final Map<int, bool> _hoverStates = {};
  final Map<int, bool> _tapStates = {};

  void updateTapState(int index, String url) {
    setState(() {
      openUrl(url);
      _tapStates[index] = true;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _tapStates.remove(index);
        });
      }
    });
  }

  void updateHoverState(int index, bool isHovering) {
    setState(() {
      _hoverStates[index] = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(socialMediaIconsList.length, (i) {
        var p = socialMediaIconsList[i];
        bool isActive = (_hoverStates[i] ?? false) || (_tapStates[i] ?? false);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () => updateTapState(i, p.url),
            onHover: (hovering) => updateHoverState(i, hovering),
            child: Icon(
              p.icon,
              color: isActive
                  ? p.iconColor
                  : Theme.of(context).colorScheme.onSurface,
              size: isActive ? 36 : p.iconSize,
            ),
          ),
        );
      }),
    );
  }
}
