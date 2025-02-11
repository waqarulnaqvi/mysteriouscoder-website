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
      url: "",
      iconColor: const Color(0xff3b5998),
      iconSize: 28),

  SocialMediaIcons(icon: Icons.mail,
      iconColor: Colors.grey,
      url: "",
      iconSize: 32),

  SocialMediaIcons(
      icon: FontAwesomeIcons.youtube,
      iconColor: const Color(0xffff0000),
      url: "",
      iconSize: 30),

  SocialMediaIcons(
      icon: FontAwesomeIcons.instagram,
      iconColor: const Color(0xffc13584),
      url: "",
      iconSize: 28),
];

