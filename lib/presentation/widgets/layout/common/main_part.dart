import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/common_description.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles.dart';
import '../../../models/social_media_icons.dart';
import '../../../pages/responsive_layout.dart';
import '../../color_change_button.dart';
import '../../common_main_heading.dart';
import '../../entrance_fader.dart';
import '../../global_widgets.dart';
import '../../static_image.dart';
import '../../zoom_animation.dart';

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
          spacerH(5),
          AnimatedText(),
          spacerH(),
          CommonDescription(),
          spacerH(),
          CommonSocialMediaPlatforms(),
          spacerH(),
          // w < Constants.maxPhoneWidth?
          // commonButton(context):
          ColorChangeButton(onTap: onTap),
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
            spacerH(5),
            AnimatedText(),
            spacerH(),
            SizedBox(width: w * 0.5, child: CommonDescription(textAlign: TextAlign.start,)),
            spacerH(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonSocialMediaPlatforms(),
                spacerH(),
                ColorChangeButton(
                  w: 220,
                  h: 50,
                  fontSize: 16,
                  onTap: onTap,
                ),
              ],
            ),
            spacerH(40),
          ],
        ),
        spacerW(),
        Padding(
          padding: EdgeInsets.only(top: h*0.12),
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
          style: reusableTextStyle2(context: context),
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

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
          isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts: animatedTextList(context),
    );
  }
}

List<TyperAnimatedText> animatedTextList(BuildContext context) =>[
  TyperAnimatedText(Constants.animationText1,
      speed: const Duration(milliseconds: 50),
      textStyle: reusableTextStyle2(context: context),),
  TyperAnimatedText(Constants.animationText2,
      speed: const Duration(milliseconds: 50),
      textStyle: reusableTextStyle2(context: context),),
  TyperAnimatedText(Constants.animationText3,
      speed: const Duration(milliseconds: 50),
      textStyle: reusableTextStyle2(context: context),)
];