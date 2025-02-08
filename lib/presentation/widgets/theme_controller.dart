import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/provider/theme_provider.dart';

class ThemeController extends StatelessWidget {
  const ThemeController({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context, listen: false);

    return Padding(padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 4,
        shape: const CircleBorder(),
        child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: const CircleBorder(),
            ),
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
      ),
    );
  }
}
