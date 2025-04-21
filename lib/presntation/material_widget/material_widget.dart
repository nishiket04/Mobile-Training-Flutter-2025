import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialWidget extends StatefulWidget {
  const MaterialWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MaterialWidget();
}

class _MaterialWidget extends State<MaterialWidget> {
  String text = "Home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Material Widget Task"),
          backgroundColor: Colors.cyan,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a search term",
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 50,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(48),
                        child: Image.asset(
                          'assets/images/anime.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Nishiket Bhatt",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Messages'),
                onTap: () {
                  setState(() {
                    text = "Messages";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {
                  setState(() {
                    text = "Profile";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  setState(() {
                    text = "Settings";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("assets/images/anime.jpg", fit: BoxFit.fill),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "Tektur",
                  color: Colors.white,
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
