import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIcons{
  final IconData icon;
  final String url;
  SocialMediaIcons({required this.icon, required this.url});
}

List<SocialMediaIcons> socialMediaIconsList = [
  SocialMediaIcons(icon: FontAwesomeIcons.whatsapp, url: ""),
  SocialMediaIcons(icon: Icons.mail, url: ""),
  SocialMediaIcons(icon: FontAwesomeIcons.linkedin, url: ""),
  SocialMediaIcons(icon: FontAwesomeIcons.instagram, url: ""),
  SocialMediaIcons(icon: FontAwesomeIcons.google, url: "")
  ];