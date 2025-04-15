import 'package:flutter/material.dart';
import 'package:flutter_task/responsive_adptive/card.dart';
import 'package:flutter_task/responsive_adptive/responsive_card.dart';
import 'package:flutter_task/responsive_adptive/responsive_form.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<StatefulWidget> createState() => _Responsive();
}

class _Responsive extends State<Responsive> {
  List<Widget> l = [CardResonsive(), ResponsiveForm()];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLargeScreen = screenWidth >= 900 || screenHeight >= 900;
    return Scaffold(
      appBar: AppBar(),
      body: l[_index],
      drawer: isLargeScreen ? _buildTabletDrawer() : null,
      bottomNavigationBar: isLargeScreen ? null : _buildMobileBottomBar(),
    );
  }

  Widget _buildTabletDrawer() {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () {
              setState(() {
                _index = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Form"),
            leading: Icon(Icons.format_align_justify),
            onTap: () {
              setState(() {
                _index = 1;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMobileBottomBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (value) {
        setState(() {
          _index = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_align_justify),
          label: "Form",
        ),
      ],
    );
  }
}