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
      height: w < Constants.maxPhoneWidth
          ? h
          : w < Constants.maxTabletWidth
          ? h * 0.9
          : h * 0.7,
      child:  ResponsiveLayout(mobile: mobile(context), tablet: mobile(context), desktop: web(context)),
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

          Text(
            "Mysterious Coder",
            style: reusableTextStyle(
                fontSize: 30, color: Theme.of(context).colorScheme.onSurface),
          ),
          FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hi there, Welcome to Official Mysterious Coder Page",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18),
                textAlign: TextAlign.center,),
                spacerW(10),
                Image.asset(
                  StaticImage.hi,
                  height: 35,
                ),
              ],
            ),
          ),
          spacerH(),
          Text(
              "I'm a Senior Digital Marketing Specialist with over 5 years of experience in the field. I have worked with various clients and helped them achieve their marketing goals. I have a strong understanding of the latest marketing trends and techniques. I am passionate about marketing and always looking for new ways to improve my skills.",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
          textAlign: TextAlign.center,),
          spacerH(),
          ColorChangeButton(
            text: "Get in Touch", onTap: () {  },

          ),

          // ResponsiveLayout(mobile: mobile(context), tablet: mobile(context), desktop: web(context)),
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
            Text(
              "Mysterious Coder",
              style: reusableTextStyle(
                  fontSize: 30, color: Theme.of(context).colorScheme.onSurface),
            ),
            spacerH(5),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hi there, Welcome to Official Mysterious Coder Page",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18),
                    textAlign: TextAlign.center,),
                  spacerW(10),
                  Image.asset(
                    StaticImage.hi,
                    height: 35,
                  ),
                ],
              ),
            ),
            spacerH(),
            SizedBox(
              width: w*0.5,
              child: Text(
                  "I'm a Senior Digital Marketing Specialist with over 5 years of experience in the field. I have worked with various clients and helped them achieve their marketing goals. I have a strong understanding of the latest marketing trends and techniques. I am passionate about marketing and always looking for new ways to improve my skills.",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
            ),
            ),
            spacerH(),
            ColorChangeButton(
              text: "Get in Touch", onTap: () {  },

            ),

            // ResponsiveLayout(mobile: mobile(context), tablet: mobile(context), desktop: web(context)),
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
}
