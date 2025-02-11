import 'package:flutter/material.dart';

class NavItems {
  final String title;
  final IconData icon;

  NavItems({required this.title, required this.icon});
}

List<NavItems> navItems = [
  NavItems(
    icon: Icons.home,
    title: 'Home',
  ),
  // NavItems(
  //   icon: Icons.person,
  //   title: 'About Us',
  // ),
  NavItems(
    icon: Icons.handyman_outlined,
    title: 'Services',
  ),
  NavItems(
    icon: Icons.apps,
    title: 'Projects',
  ),
  NavItems(title: 'Contact Us', icon: Icons.quick_contacts_mail)
];
