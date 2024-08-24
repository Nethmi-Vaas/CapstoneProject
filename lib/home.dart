import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_application_2/Pages/dropD.dart';

import 'package:flutter_application_2/Pages/userguide.dart';

import 'Pages/dashboard.dart';
import 'Pages/feedbacks.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;

  final List<Widget> _pages = [
    const DashBoardHome(),
    const DropDown(),
     userGuide(),
    const FeedBacks(),
     // Placeholder for settings or other options
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Dashboard"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.filter_alt),
            title: const Text("Crop Selection"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.menu_book),
            title: const Text("User Guide"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.feedback),
            title: const Text("Feedback"),
            selectedColor: Colors.green,
          ),

        ],
      ),
    );
  }
}


