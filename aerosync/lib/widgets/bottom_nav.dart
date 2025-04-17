import 'package:aerosync/pages/home.dart';
import 'package:aerosync/pages/profile.dart';
import 'package:aerosync/pages/search.dart';
import 'package:aerosync/pages/tickets.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:aerosync/widgets/bookings.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, required this.cityid}) : super(key: key);
  final String cityid;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      Home(cityid: widget.cityid.toString()),
      // const Search(),
      const Bookings(),
      // const Profile()
    ];
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Styles.bgColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20, color: Styles.primaryColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Styles.primaryColor,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
          //   activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
            label: 'Tickets',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
          //   activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
          //   label: 'Profile',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
