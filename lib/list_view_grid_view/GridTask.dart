import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DummyData.dart';

class GridTask extends StatefulWidget {

  const GridTask({super.key});

  @override
  State<GridTask> createState() {
    print("In createState");
    return _GridTaskState();
  }
}

class _GridTaskState extends State<GridTask> {
  final _persons = DummyData.getData();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    print("In initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("In didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant GridTask oldWidget) {
    print("In didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("In dispose");
    super.dispose();
  }

  @override
  void deactivate() {
    print("In deactivate");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,body: _listOfCards());
  }

  Widget _listOfCards() {
    return RefreshIndicator(
      onRefresh: (){
        return Future.delayed(Duration(seconds: 1),(){
          setState(() {
            _persons.shuffle();
          });
        });
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: (_persons.length / 2).toInt(),
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.black26,
            child: _personsCard(index),
          );
        },
      ),
    );
  }

  Widget _personsCard(int index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [Icon(Icons.account_circle,size: 50,), Text(_persons[index].name)],
    );
  }
}
