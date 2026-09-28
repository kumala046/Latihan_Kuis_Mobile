import 'package:flutter/material.dart';
import 'package:latkuis/views/home.dart';
import 'package:latkuis/views/profile.dart';

class Root extends StatefulWidget {
  final String username;
  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      ProfilePage(
        username: widget.username
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animal List",
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}