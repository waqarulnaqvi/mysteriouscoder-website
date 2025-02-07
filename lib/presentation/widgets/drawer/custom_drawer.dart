import 'package:flutter/material.dart';
import 'package:mysteriouscoder/domain/data/nav_items.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/drawer_tile.dart';
import 'package:mysteriouscoder/shared/styles.dart';

import '../../../shared/constants.dart';
import '../static_image.dart';

class CustomDrawer extends StatelessWidget {
  final double w;
  final double h;

  const CustomDrawer({super.key, required this.w, required this.h});


  @override
  Widget build(BuildContext context) {
    return Container(
        width: w,
        height: h,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              Color.fromARGB(255, 184, 241, 240),
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
                      Theme.of(context).colorScheme.primary.withOpacity(0.6),
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
                      backgroundImage:
                          AssetImage(StaticImage.logo),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(Constants.title,
                        style: reusableTextStyle(fontSize: 26)),
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
                        Navigator.pop(context);
                      });
                },
                itemCount: navItems.length,
              ),
            ],
          ),
        ));
  }
}
