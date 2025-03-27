import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/dialog_custom_widget/profile_details_widget.dart';

class CustomWidgetTask extends StatefulWidget {
  const CustomWidgetTask({super.key});

  @override
  State<StatefulWidget> createState() => _CustomWidgetTask();
}

class _CustomWidgetTask extends State<CustomWidgetTask> {
  int _index = 0;
  List<Widget> _screen = [TabScreen(),ColorScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screen[_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (index){
              setState(() {
                _index = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm),
                label: "Alarm",
              ),
            ],
          )
      ),
    );
  }
}

class ColorScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(child: Text("Colored Screen"),),
    );
  }

}

class TabScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.account_circle_outlined)),
              Tab(icon: Icon(Icons.adb)),
            ],
          ),
        ),
        body: const TabBarView(children: [ScreenA(), ScreenB()]),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          child: Icon(Icons.add),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Yay! A SnackBar!'),
                action: SnackBarAction(label: 'Undo', onPressed: () {}),
              ),
            );
          },
        ),
      ),
    );
  }

}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: double.infinity),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ProfileCard(
            image: "assets/images/anime.jpg",
            name: "Nishiket",
            bio: "Mobile Application Developer",
            height: 150.0,
            width: 150.0,
            onSwap: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                print("Slides Right");
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                print("Slides Left");
              }
            },
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Nishiket"),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: [Text("Bio: Mobile Application Developer")],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            },
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text("Show Bottom Sheet"),
      ),
    );
  }
}
