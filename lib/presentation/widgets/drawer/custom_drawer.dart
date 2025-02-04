import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/drawer_tile.dart';
import 'package:mysteriouscoder/shared/styles.dart';

import '../../../shared/global.dart';
// import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  final double w;
  final double h;

  const CustomDrawer({super.key, required this.w, required this.h});

  // Future<void> _launchUrl(String url) async{
  //   final Uri _url =Uri.parse(url);
  //   if(await canLaunchUrl(_url)){
  //     await launchUrl(_url,mode:L);
  // }

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
                    colors: [themeColor, dark],
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
                          AssetImage("assets/images/mysteriouscoder_logo.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Mysterious Coder",
                        style: reusableTextStyle(fontSize: 26)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerTile(
                  icon: Icons.home,
                  title: "Home",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              DrawerTile(
                  icon: Icons.person,
                  title: "About",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              DrawerTile(
                  icon: Icons.work,
                  title: "Projects",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              DrawerTile(
                  icon: Icons.settings_applications_outlined,
                  title: "Skills",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              DrawerTile(
                  icon: Icons.contact_mail,
                  title: "Contact",
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ));
  }
}
