import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task/strems/PersonsModel.dart';

class StremsTask extends StatefulWidget {
  const StremsTask({super.key});

  @override
  State<StatefulWidget> createState() => _StremsTask();
}

class _StremsTask extends State<StremsTask> {
  final List<PersonsModel> _persons = [];
  var _tapPosition;
  final StreamController<int> _controller = StreamController<int>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<int>(
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data ?? 0,
          cacheExtent: 3,
          itemBuilder: (context, index) {
            return _buildPersonCard(index);
          },
        );
      },
      stream: _controller.stream,
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  Widget _buildPersonCard(int index) {
    return GestureDetector(
      onTapDown: _storePosition,
      onLongPress: () {
        showMenu(
          context: context,
          position: RelativeRect.fromRect(
            _tapPosition! & const Size(0, 0),
            Rect.zero,
          ),
          items: [_buildPopUpItem(index)],
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(_persons[index].name), Text(_persons[index].email)],
          ),
        ),
      ),
    );
  }

  PopupMenuItem _buildPopUpItem(int index) {
    return PopupMenuItem(
      child: Icon(Icons.edit),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return _buildDilogBox(
              name: _persons[index].name,
              email: _persons[index].email,
              index: index,
            );
          },
        );
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _buildDilogBox();
          },
        );
      },
    );
  }

  Widget _buildDilogBox({String name = "", String email = "", int? index = null,}) {
    _nameController.text = name.isNotEmpty ? name : "";
    _emailController.text = email.isNotEmpty ? email : "";
    return AlertDialog(
      content: SizedBox(
        height: 140,
        child: Column(
          spacing: 10,
          children: [
            Text("Enter User Detail"),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: "Enter Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "Enter Email"),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (index == null) {
              _persons.add(
                PersonsModel(_nameController.text, _emailController.text),
              );
            } else if (index >= 0) {
              _persons[index].name = _nameController.text;
              _persons[index].email = _emailController.text;
            }
            _nameController.clear();
            _emailController.clear();
            _controller.sink.add(_persons.length);
            Navigator.pop(context);
          },
          child: Text("Submit"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
      ],
    );
  }
}
