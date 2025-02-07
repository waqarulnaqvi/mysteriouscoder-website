import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/provider/theme_provider.dart';
import '../../../../shared/styles.dart';
import '../../static_image.dart';

class AppBarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppBarMobile({super.key,required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context, listen: false);

      return AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
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
          IconButton(
              onPressed: () {
                if (provider.mode == ThemeMode.dark) {
                  provider.mode = ThemeMode.light;
                } else {
                  provider.mode = ThemeMode.dark;
                }
              },
              icon: Image(
                color: Theme.of(context).colorScheme.onSurface,
                image: AssetImage(provider.mode == ThemeMode.light
                    ? "assets/icons/dark_icon.png"
                    : "assets/icons/light_theme.png"),
                width: 30,
                height: 30,
              )),
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

