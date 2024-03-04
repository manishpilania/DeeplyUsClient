import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'explore_screen.dart';
import 'history_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _buildPage(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFF3BC2B6),
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          elevation: 20,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
              label: 'History',
            )
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomeScreenPage();
      case 1:
        return const ExploreScreen();
      case 2:
        return const HistoryScreen();
      default:
        return const HomeScreenPage();
    }
  }
}

