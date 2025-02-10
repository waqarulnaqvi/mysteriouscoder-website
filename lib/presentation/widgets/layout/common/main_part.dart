import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import '../../../../domain/data/social_media_icons.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/styles.dart';
import '../../clipper/wave_container_clipper_bottom.dart';
import '../../color_change_button.dart';
import '../../entrance_fader.dart';
import '../../static_image.dart';
import '../../typing_effect.dart';
import '../../clipper/wave_container_clipper.dart';
import '../../zoom_animation.dart';
import 'global_widgets.dart';

class MainPart extends StatelessWidget {
  final double w;
  final double h;

  const MainPart({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      // height: h*0.7,
      // height: w < Constants.maxPhoneWidth
      //     ? h
      //     : w < Constants.maxTabletWidth
      //         ? h * 0.9
      //         : h * 0.7,
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
          const EntranceFader(
            offset: Offset(0, 0),
            delay: Duration(seconds: 1),
            duration: Duration(milliseconds: 800),
            child: ZoomAnimations(),
          ),
          spacerH(10),
          commonHeading(context),
          commonSubHeading(context),
          spacerH(),
          commonDescription(context,isMobile: true),
          spacerH(),
          commonButton(context),
          spacerH(),
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
            commonHeading(context),
            spacerH(5),
            commonSubHeading(context),
            spacerH(),
            SizedBox(width: w * 0.5, child: commonDescription(context)),
            spacerH(),
            commonButton(context),
            spacerH(),

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

  Widget commonHeading(BuildContext context) {
    return Text(
      "Mysterious Coder",
      style: reusableTextStyle(
          fontSize: 30, color: Theme.of(context).colorScheme.onSurface),
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

  Widget commonDescription(BuildContext context,{bool isMobile=false}) {
    return Text(
      "🚀 Mobile & Web App Development – High-quality solutions for Android, iOS, and web. ⚡ Fast & Scalable Apps – Optimized performance with clean, maintainable code. 🛠 Cross-Platform Efficiency – One codebase for multiple platforms. 💼 Freelancing Solutions – Tailored services to meet diverse business needs."
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
      ),
      textAlign: isMobile ? TextAlign.center : TextAlign.start,
    );

  }

  Widget commonButton(BuildContext context) {
    return ColorChangeButton(
      text: "Get in Touch",
      onTap: () {},
    );
  }
}
