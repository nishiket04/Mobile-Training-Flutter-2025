import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _body(context)));
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoutePage()),
              );
            },
            child: Text("push"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/routePage", arguments: "Data from pushNamed");
            },
            child: Text("pushNamed"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          const RoutePage(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
            child: Text("Custom Transition"),
          ),
        ),
      ],
    );
  }
}

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? data = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Received text: $data",textAlign: TextAlign.center,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go back"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }, child: Text("Go to Home page"))
        ],
      ),
    );
  }
}
