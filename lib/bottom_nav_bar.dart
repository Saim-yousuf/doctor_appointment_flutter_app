import 'package:doctor_appointment/booking/my_booking.dart';
import 'package:doctor_appointment/profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home/homepage.dart';
import 'location/location.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Location(),
    MyBooking(),
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_page),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GNav(
              backgroundColor: Colors.grey.shade200,
              color: Colors.grey,
              activeColor: Colors.grey.shade800,
              tabBackgroundColor: Colors.black.withOpacity(0.2),
              gap: 5,
              onTabChange: (page) {
                setState(() {
                  _page = page;
                });
              },
              selectedIndex: _page,
              padding: EdgeInsets.all(8),
              tabs: const [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.location_on_rounded,
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                ),
                GButton(
                  icon: Icons.person,
                ),
              ]),
        ),
      ),
    );
  }
}
