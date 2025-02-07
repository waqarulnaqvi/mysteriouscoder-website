import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:mysteriouscoder/shared/styles.dart';

import '../../entrance_fader.dart';
import '../../zoom_animation.dart';

class AboutMe extends StatelessWidget {
  final double w;
  const AboutMe({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("About Me",style: reusableTextStyle(fontSize: 30,color: Theme.of(context).colorScheme.onSurface),),
          spacerH(15),

          const EntranceFader(
            offset: Offset(0, 0),
            delay: Duration(seconds: 1),
            duration: Duration(milliseconds: 800),
            child: ZoomAnimations(),
          ),

          Text("My name is ${Constants.title}, and I am a freelance Marking and Digital Marketing Consultant. Proudly based in Lucknow ,US and working with a clients from around the world and I am a freelance Marking and Digital Marketing Consultant. Proudly based in Lucknow ,US and working with a clients from around the world.",style: reusableTextStyle(fontSize: 16,color: Theme.of(context).colorScheme.onSurface),
          textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
