import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIcons {
  final IconData icon;
  final String url;
  final Color iconColor;
  final double iconSize;

  SocialMediaIcons({
    required this.icon,
    required this.url,
    required this.iconColor,
    required this.iconSize,
  });
}

List<SocialMediaIcons> socialMediaIconsList = [
  SocialMediaIcons
    (
      icon: FontAwesomeIcons.facebook,
      url: "https://www.facebook.com/profile.php?id=100094268001160",
      iconColor: const Color(0xff3b5998),
      iconSize: 28),

  SocialMediaIcons(icon: FontAwesomeIcons.whatsapp,
      iconColor: const Color(0xff25d366),
      url: "https://whatsapp.com/channel/0029Vb1Se9gKrWR1TBGlCs1x",
      iconSize: 30),

  SocialMediaIcons(
      icon: FontAwesomeIcons.youtube,
      iconColor: const Color(0xffff0000),
      url: "https://youtube.com/@mysterious_coder?si=YXohokmpArHfb82O",
      iconSize: 30),

  SocialMediaIcons(
      icon: FontAwesomeIcons.instagram,
      iconColor: const Color(0xffc13584),
      url: "https://www.instagram.com/mysteriouscoder__?igsh=MTI5eGpxanE5ZGd5Mg==",
      iconSize: 28),
];

