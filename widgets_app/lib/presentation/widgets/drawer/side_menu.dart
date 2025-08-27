import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  SideMenu({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        Navigator.pushNamed(context, menuItem.url);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Flutter Widgets App'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        const Divider(),
        const Padding(padding: EdgeInsets.all(20.0), child: Text('Options')),
        NavigationDrawerDestination(
          icon: Icon(Icons.credit_card),
          label: Text('Cards'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.color_lens),
          label: Text('Theme Changer'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.smart_button),
          label: Text('Buttons'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.refresh),
          label: Text('Progress Indicator'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_alert),
          label: Text('Snackbar'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.animation),
          label: Text('Animated Container'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.app_registration),
          label: Text('UI Controls'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.view_list),
          label: Text('Infinite Scroll'),
        ),
      ],
    );
  }
}
