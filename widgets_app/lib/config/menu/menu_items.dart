import 'package:flutter/material.dart';
import '../../config/routes/routes.dart';

class MenuItem {
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
    title: 'App Tutorial',
    subTitle: 'Page View, Tabs, and Sliders',
    url: "/app-tutorial",
    icon: Icons.app_registration,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Cards',
    url: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Theme Changer',
    url: '/theme-changer',
    icon: Icons.color_lens,
  ),
  MenuItem(
    title: 'Buttons',
    subTitle: 'Buttons',
    url: AppRoutes.buttonsRoute,
    icon: Icons.smart_button,
  ),
  MenuItem(
    title: 'Progress Indicator',
    subTitle: 'Progress Indicator',
    url: "/progress",
    icon: Icons.refresh,
  ),
  MenuItem(
    title: 'Snackbar',
    subTitle: 'Snackbar',
    url: "/snackbar",
    icon: Icons.add_alert,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Animated Container',
    url: "/animated-container",
    icon: Icons.animation,
  ),
  MenuItem(
    title: 'UI controls',
    subTitle: 'UI controls',
    url: "/ui-controls",
    icon: Icons.control_point,
  ),
  MenuItem(
    title: 'Infinite Scroll',
    subTitle: 'Infinite Scroll',
    url: "/infinite-scroll",
    icon: Icons.view_list,
  ),
  MenuItem(
    title: 'Counter',
    subTitle: 'Counter',
    url: "/counter",
    icon: Icons.add,
  ),
];
