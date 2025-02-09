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
    return Container(
      width: w,
      height: h*0.7,
      // height: w < Constants.maxPhoneWidth
      //     ? h * 1.6
      //     : w < Constants.maxTabletWidth
      //     ? h * 1.53
      //     : h * 1.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacerH(30),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hi there, Welcome to My Space ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 18)),
                  spacerW(10),
                  Image.asset(
                    StaticImage.hi,
                    height: 35,
                  ),
                ],
              ),
              spacerH(10),
              Text(
                "Mysterious Coder",
                style: reusableTextStyle(
                    fontSize: 30, color: Theme.of(context).colorScheme.onSurface),
              ),
              spacerH(),

              ColorChangeButton(
                text: "Get in Touch", onTap: () {  },

              ),

              // ResponsiveLayout(mobile: mobile(context), tablet: mobile(context), desktop: web(context)),
            ],
          ),
          const EntranceFader(
            offset: Offset(0, 0),
            delay: Duration(seconds: 1),
            duration: Duration(milliseconds: 800),
            child: ZoomAnimations(),
          ),
        ],
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
              "I'm a Senior Digital Marketing Specialist with over 5 years of experience in the field. I have worked with various clients and helped them achieve their marketing goals. I have a strong understanding of the latest marketing trends and techniques. I am passionate about marketing and always looking for new ways to improve my skills.",
              style: reusableTextStyle(fontSize: 20, color: Colors.white)),
        ),
        spacerH(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 180,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.transparent,
              child: InkWell(
                child: Center(
                  child: Text(
                    "HOW I CAN HELP",
                    style: reusableTextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
        spacerH(),
        Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Constants.maxPhoneWidth / 1.4,
              ),
              child: Image(
                image: const AssetImage("assets/images/help_image.png"),
                width: w,
                fit: BoxFit.cover,
              )),
        )
      ],
    );
  }

  Widget web(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                      "I'm a Senior Digital Marketing Specialist with over 5 years of experience in the field. I have worked with various clients and helped them achieve their marketing goals. I have a strong understanding of the latest marketing trends and techniques. I am passionate about marketing and always looking for new ways to improve my skills.",
                      style:
                      reusableTextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 180,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        )),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.transparent,
                      child: InkWell(
                        child: Center(
                          child: Text(
                            "HOW I CAN HELP",
                            style: reusableTextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        Expanded(
          child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Constants.maxPhoneWidth / 1.4,
                ),
                child: Image(
                  image: const AssetImage("assets/images/help_image.png"),
                  width: w,
                  fit: BoxFit.cover,
                )),
          ),
        )
      ],
    );
  }
}
