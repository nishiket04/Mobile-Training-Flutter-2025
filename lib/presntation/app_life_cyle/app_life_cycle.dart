import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLifeCycleTask extends StatefulWidget {
  const AppLifeCycleTask({super.key});

  @override
  State<StatefulWidget> createState() => _AppLifeCycleTask();
}

class _AppLifeCycleTask extends State<AppLifeCycleTask>
    with WidgetsBindingObserver {
  Timer? timer;
  // bool isActive = true;
  int sec = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _timer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
      switch (state) {
        case AppLifecycleState.detached:
          timer?.cancel();
          break;
        case AppLifecycleState.resumed:
            _timer();
          break;
        case AppLifecycleState.inactive:
          timer?.cancel();
          break;
        case AppLifecycleState.hidden:
          timer?.cancel();
          break;
        case AppLifecycleState.paused:
          timer?.cancel();
          break;
      }
  }

  Future<void> _timer() async {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (mounted) {
          setState(() {
            sec ++;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Time(sec): $sec")));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
