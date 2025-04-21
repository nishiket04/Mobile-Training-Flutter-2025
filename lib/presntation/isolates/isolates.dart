import 'dart:isolate';

import 'package:flutter/material.dart';

Isolate? _isolate;

class IsolatesTask extends StatefulWidget {
  const IsolatesTask({super.key});

  @override
  State<StatefulWidget> createState() => _IsolatesTask();
}

class _IsolatesTask extends State<IsolatesTask> {
  double result = 1.0;
  final _numberController = TextEditingController();
  String _state = "Calculate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [_buildInputFiled(), _buildButton(), Text("Result: $result")],
      ),
    );
  }

  Widget _buildInputFiled() {
    return TextField(
      controller: _numberController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter Number",
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(onPressed: _onPressed, child: Text(_state)),
    );
  }

  void _onPressed() {
    if (_state == "Stop") {
      _isolate?.kill(priority: 0);
      setState(() {
        _state = "Calculate";
      });
      return;
    }
    setState(() {
      _state = "Stop";
    });

    final resultPort = ReceivePort();

    Isolate.spawn(_isolateMain, [
      double.parse(_numberController.text),
      resultPort.sendPort,
    ]).then((value) {
      _isolate = value;
    });

    resultPort.listen((message) {
      setState(() {
        _state = "Calculate";
        result = message;
      });
    });
  }
}

Future<void> _isolateMain(List<dynamic> arg) async {
  final resultPort = arg[1];
  final num = arg[0];
  double sum = 0.0;
  for (int i = 0; i <= num; i++) {
    sum += i;
  }
  await Future.delayed(Duration(seconds: 2));
  Isolate.exit(resultPort, sum);
}
