import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/data/nav_items.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/provider/theme_provider.dart';
import '../../../../shared/styles.dart';
import '../../static_image.dart';

class AppBarWeb extends StatelessWidget {
  final double w;

  const AppBarWeb({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      width: w,
      height: const Size.fromHeight(kToolbarHeight).height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(StaticImage.logo),
              radius: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(Constants.title,
              style: reusableTextStyle(
                  color: Theme.of(context).colorScheme.surface)),
          const Spacer(flex: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navItems
                .map((item) {
                  int index = navItems.indexOf(item);

                     return MouseRegion(
                          onEnter: (_) {
                            provider.hoveredItem=index;
                          },
                          onExit: (_) {
                            provider.hoveredItem=-1;
                          },
                        child: Container(
                            width: 100,
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: provider.hoveredItem==index ? [
                                const Color(0xff6a11cb), const Color(0xff2575fc)
                              ]: [
                                Colors.transparent, Colors.transparent
                              ]),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Center(child: Text(item.title, style: reusableTextStyle(fontSize: 16,color: Theme.of(context).colorScheme.surface)))),
                      );
  }
                )
                .toList(),
          ),
          IconButton(
              onPressed: () {
                if (provider.mode == ThemeMode.dark) {
                  provider.mode = ThemeMode.light;
                } else {
                  provider.mode = ThemeMode.dark;
                }
              },
              icon: Image(
                image: AssetImage(provider.mode == ThemeMode.light
                    ? "assets/icons/dark_icon.png"
                    : "assets/icons/light_theme.png"),
                width: 30,
                height: 30,
                color: Theme.of(context).colorScheme.onSurface,
              )),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}
