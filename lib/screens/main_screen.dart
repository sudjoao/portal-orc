import 'package:flutter/material.dart';
import 'package:portal_orc/screens/home_screen.dart';
import 'package:portal_orc/screens/profile_screen.dart';
import 'package:portal_orc/styles/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  List<Map<String, dynamic>> bottomNavigatorScreens = [
    {
      "title": "Diretorias",
      "screen": HomeScreen(),
    },
    {
      "title": "Metas",
      "screen": HomeScreen(),
    },
    {
      "title": "Perfil",
      "screen": ProfileScreen(),
    }
  ];
  List<Map<String, dynamic>> bottomNavigatorIconTitles = [
    {"icon": Icon(Icons.group_work), "label": "Diretorias"},
    {"icon": Icon(Icons.home), "label": "Início"},
    {"icon": Icon(Icons.account_circle), "label": "Perfil"},
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenOrc3,
      appBar: AppBar(
        backgroundColor: kGreenOrc1,
        shadowColor: Color(0x00),
        title: Text(bottomNavigatorScreens[_selectedIndex]["title"]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kGreenOrc2,
        type: BottomNavigationBarType.fixed,
        items: bottomNavigatorIconTitles.map((Map<String, dynamic> iconTitle) {
          return BottomNavigationBarItem(
              icon: iconTitle["icon"], label: iconTitle["label"]);
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: kGreenOrc1,
        onTap: _onItemTapped,
      ),
      body: bottomNavigatorScreens[_selectedIndex]["screen"],
    );
  }
}
