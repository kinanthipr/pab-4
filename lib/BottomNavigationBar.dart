import 'package:flutter/material.dart';
import 'package:project1/day1.dart';
import 'package:project1/hari.dart';
import 'package:project1/profile.dart';
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});
  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}
class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectIndex = 0;
  final List<Widget> _screenList = [
    HariPage(),
    Day1(),
    ProfilePage(),
  ];
  void pergantianScreen(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: pergantianScreen,
        backgroundColor: Colors.blue, //background
        selectedItemColor: Colors.white, //icon/text saat dipilih
        unselectedItemColor: Colors.white70, //icon/text saat tidak dipilih
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
