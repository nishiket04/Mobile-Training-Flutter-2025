import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GridTask.dart';
import 'ListTask.dart';

class ListViewGridView extends StatefulWidget {
  const ListViewGridView({super.key});

  @override
  State<StatefulWidget> createState() => _ListViewGridView();
}

class _ListViewGridView extends State<ListViewGridView> {
  late List<Widget> _screens;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _screens = [ListTask(),GridTask()];
    _currentIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: _screens[_currentIndex],
          bottomNavigationBar: _bottomNavBar()),
    );
  }

  // Bottom Navigation Function
  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: _bottomNavItem(),
    );
  }

  // Bottom Navigation Item
  List<BottomNavigationBarItem> _bottomNavItem(){
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.list), label: "List View"),
      BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: "Grid View"),
    ];
  }
}
