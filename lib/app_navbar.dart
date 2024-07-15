import 'package:flutter/material.dart';
import 'package:kafiil_test/features/countries/screens/countries_screen.dart';
import 'package:kafiil_test/features/services/screens/services_screen.dart';
import 'package:kafiil_test/features/who_am_i/screens/who_am_i_screen.dart';

import 'common/app_colors.dart';
import 'common/app_icon_data.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const WhoAmIScreen(),
    const CountriesScreen(),
    const ServicesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIconData.profile_icon),
            label: 'Who Am I',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIconData.earth_icon),
            label: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIconData.cart_icon),
            label: 'Services',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.white,
        // selectedItemColor: AppBar,
        onTap: _onItemTapped,
      ),
    );
  }
}
