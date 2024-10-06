import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  Container(
    color: Colors.green,
  ),
  Container(
    color: Colors.red,
  ),
  Container(
    color: Colors.blue,
  ),
];

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Tracker'),
      ),
      body: const Center(
        child: Text('Welcome to Work Tracker!'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        enableFeedback: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            activeIcon: Icon(CupertinoIcons.square_list_fill),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
