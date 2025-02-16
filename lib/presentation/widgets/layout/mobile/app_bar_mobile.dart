

import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles.dart';
import '../../static_image.dart';
import '../../theme_controller.dart';

class AppBarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarMobile({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(StaticImage.logo),
          radius: 20,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(Constants.title,
          style:
              reusableTextStyle(color: Theme.of(context).colorScheme.surface)),
      actions: [
        ThemeController(),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
          child: Image(
            image: const AssetImage("assets/icons/menu.png"),
            width: 30,
            height: 30,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
