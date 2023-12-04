import 'package:flutter/material.dart';
import 'package:tripify_app/views/home/section_destination.dart';
import 'package:tripify_app/views/home/section_home.dart';
import 'package:tripify_app/views/home/section_profile.dart';
import 'package:tripify_app/views/home/section_transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // fungsi di bawah ini buat panggil section page
  static const List<Widget> _widgetOptions = <Widget>[
    SectionHome(),
    SectionDestination(),
    // Text('Profile'),
    SectionTransaction(),
    SectionProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // existing code
          ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Destination',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF004C5C),
        onTap: _onItemTapped,
      ),
    );
  }
}
