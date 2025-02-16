import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/models/nav_items.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/drawer_tile.dart';
import 'package:mysteriouscoder/core/styles.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../static_image.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;
  final double w;
  final double h;

  const CustomDrawer({super.key, required this.w, required this.h, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: provider.themeMode == ThemeMode.dark
                    ? [
                        Colors.white,
                        Color.fromARGB(255, 184, 241, 240),
                      ]
                    : [
                        Theme.of(context).colorScheme.secondaryContainer,
                        Theme.of(context).colorScheme.primary,
                      ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(
                        StaticImage.logo,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(Constants.title,
                        style: reusableTextStyle(
                            fontSize: 26,
                            color: Theme.of(context).colorScheme.surface)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DrawerTile(
                      icon: navItems[index].icon,
                      title: navItems[index].title,
                      onTap: () {
                        index==0?onNavItemTap(index):
                        onNavItemTap(index+1);
                      });
                },
                itemCount: navItems.length,
              ),
            ],
          ),
        ));
  }
}
