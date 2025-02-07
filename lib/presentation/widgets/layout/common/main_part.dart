import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import '../../../../domain/data/social_media_icons.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/styles.dart';
import '../../clipper/wave_container_clipper_bottom.dart';
import '../../static_image.dart';
import '../../typing_effect.dart';
import '../../clipper/wave_container_clipper.dart';
import 'global_widgets.dart';

class MainPart extends StatelessWidget {
  final double w;
  final double h;
  const MainPart({super.key, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveContainerClipperBottom(),
      child: Container(
        width: w,
        height: w <Constants.maxPhoneWidth ? h * 1.6 : w<Constants.maxTabletWidth? h * 1.53 : h * 1.2,
        color: Theme
            .of(context)
            .colorScheme
            .onPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveContainerClipper(),
              child: Container(
                width: w,
                height: h * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return IconButton(
                              onPressed: () {
                                openUrl(socialMediaIconsList[index].url);
                              },
                              icon: Icon(
                                socialMediaIconsList[index].icon,
                                color:
                                Theme
                                    .of(context)
                                    .colorScheme
                                    .surface,
                              ));
                        },
                        itemCount: socialMediaIconsList.length,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: w,
                      child: Text(Constants.title.toUpperCase(),
                          style: reusableTextStyle(
                              fontSize: 50,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onPrimary),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 15),
                  const TypingEffect(
                        text: "Senior Digital Marketing Specialist",
                        fontSize: 20,
                      ),
                  ],
                ),
              ),
            ),
            spacerH(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hello, I'm ${Constants.title}",
                      style: reusableTextStyle(
                          fontSize: 30, color: Colors.black)),
                  spacerW(10),
                  Image.asset(StaticImage.hi,height: 35,),
                ],
              ),
            ),
            spacerH(),
            ResponsiveLayout(mobile: mobile(context), tablet: mobile(context), desktop: web(context)),
          ],
        ),
      ),
    );
  }
  Widget mobile(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
              "I'm a Senior Digital Marketing Specialist with over 5 years of experience in the field. I have worked with various clients and helped them achieve their marketing goals. I have a strong understanding of the latest marketing trends and techniques. I am passionate about marketing and always looking for new ways to improve my skills.",
              style: reusableTextStyle(
                  fontSize: 20, color: Colors.white)),
        ),
        spacerH(30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 180,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onPrimary,
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
          child: ConstrainedBox(constraints: const BoxConstraints(
            maxWidth: Constants.maxPhoneWidth/1.4,
          ),
          child: Image(image: const AssetImage("assets/images/help_image.png"),width: w,fit: BoxFit.cover,)
          ),
        )
      ],
    );

  }


  Widget web(BuildContext context)
  {
    return
      Row(
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
                  style: reusableTextStyle(
                      fontSize: 20, color: Colors.white)),
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
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary,
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
              child: ConstrainedBox(constraints: const BoxConstraints(
                maxWidth: Constants.maxPhoneWidth/1.4,
              ),
                  child: Image(image: const AssetImage("assets/images/help_image.png"),width: w,fit: BoxFit.cover,)
              ),
            ),
          )
        ],
    );
  }
}
