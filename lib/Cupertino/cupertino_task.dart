import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Cupertino/profile_page.dart';

class Cupertino extends StatefulWidget {
  const Cupertino({super.key});

  @override
  State<StatefulWidget> createState() => _Cupertino();
}

class _Cupertino extends State<Cupertino> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      home: _Page(context),
    );
  }

  CupertinoPageScaffold _Page(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.red,
        automaticBackgroundVisibility: false,
        middle: const Text("Cupertino Page"),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoTextField(),
          ),
          CupertinoSwitch(
            value: val,
            activeTrackColor: CupertinoColors.activeBlue,
            onChanged: (bool? value) {
              setState(() {
                val = value ?? true;
              });
            },
          ),
          CupertinoButton(
            child: Text("Save Changes"),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder:
                    (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Alert'),
                      content: const Text('Proceed with destructive action?'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
              );
            },
          ),
          CupertinoButton(child: Text("Profile Screen"), onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => ProfilePage()),
            );

          }),
        ],
      ),
    );
  }
}
