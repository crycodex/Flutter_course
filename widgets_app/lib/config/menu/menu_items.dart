import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String url;
  final IconData icon;

  const MenuItem({
     this.title = '',
     this.subTitle = '',
     this.url = '',
     this.icon = Icons.ac_unit,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter',
    subTitle: 'Counter',
    url: '/counter',
    icon: Icons.countertops,
  ),
  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Theme Changer',
    url: '/theme-changer',
    icon: Icons.color_lens,
  ),
];
