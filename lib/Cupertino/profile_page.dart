import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            automaticBackgroundVisibility: false,
            automaticallyImplyLeading: true,
            leading: Icon(CupertinoIcons.back),
          ),
          backgroundColor: Colors.white,
          child: Center(child: Text("profile Page")),
        ),
      ),
    );
  }
}
