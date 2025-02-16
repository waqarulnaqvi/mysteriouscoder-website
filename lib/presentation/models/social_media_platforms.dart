import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaPlatform {
  final IconData icon;
  final String url;
  final double iconSize;
  final Color iconColor;

  SocialMediaPlatform({
    required this.icon,
    required this.url,
    required this.iconSize,
    required this.iconColor,
  });
}

final List<SocialMediaPlatform> socialPlatforms = [
  SocialMediaPlatform(
    icon: FontAwesomeIcons.telegram,
    url: "https://t.me/klclive",
    iconSize: 28,
    iconColor: const Color(0xff0088cc),
  ),
  SocialMediaPlatform(
    icon: FontAwesomeIcons.facebook,
    url: "https://www.facebook.com/kalamlearningcenter/",
    iconSize: 28,
    iconColor: const Color(0xff3b5998),
  ),
  SocialMediaPlatform(
    icon: FontAwesomeIcons.whatsapp,
    url: "https://whatsapp.com/channel/0029Varlt5tIXnlzOPtKCe3x",
    iconSize: 28,
    iconColor: const Color(0xff25d366),
  ),
  SocialMediaPlatform(
    icon: FontAwesomeIcons.xTwitter, // Updated to a valid FontAwesome icon name.
    url: "https://x.com/klcindia",
    iconSize: 28,
    iconColor: const Color(0xff121111),
  ),
  SocialMediaPlatform(
    icon: FontAwesomeIcons.youtube,
    url: "https://www.youtube.com/@klclive",
    iconSize: 28,
    iconColor: const Color(0xffff0000),
  ),
  SocialMediaPlatform(
    icon: FontAwesomeIcons.instagram,
    url: "https://www.instagram.com/klc.live/",
    iconSize: 28,
    iconColor: const Color(0xffc13584),
  ),
];