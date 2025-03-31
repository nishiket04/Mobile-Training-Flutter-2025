import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/list_view_grid_view/DummyData.dart';

class ListTask extends StatelessWidget {
  final _persons = DummyData.getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _listOfPerson());
  }

  //
  Widget _listOfPerson() {
    return ListView.builder(
      itemCount: _persons.length ,
      shrinkWrap: false,
      cacheExtent: 3,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _listTile(index);
      },
    );
  }
  
  ListTile _listTile(int index){
    return ListTile(
      trailing: Icon(Icons.arrow_circle_right_outlined),
      leading: const Icon(Icons.account_circle),
      title: Text(_persons[index].name),
    );
  }
}
