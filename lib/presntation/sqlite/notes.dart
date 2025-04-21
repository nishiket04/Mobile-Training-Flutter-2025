import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../utils/sqlite_helper.dart';
import 'note_model.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  SqliteHelper noteDb = SqliteHelper.instance;
  Box<NoteModel> noteBox = Hive.box<NoteModel>('notes');

  List<NoteModel> notes = [];

  final key = GlobalKey<FormState>();

  bool isHive = false;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (isHive) {
      setState(() {
        notes.addAll(noteBox.values);
      });
    } else {
      noteDb.readAll().then((value) {
        setState(() {
          notes = value;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    // noteDb.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Hive:"),
          Switch(
            value: isHive,
            onChanged: (value) {
              isHive = value;
              if (isHive) {
                setState(() {
                  notes.clear();
                  notes.addAll(noteBox.values);
                });
              } else {
                notes.clear();
                noteDb.readAll().then((value) {
                  setState(() {
                    notes = value;
                  });
                });
              }
            },
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: _buildFabButton(),
    );
  }

  Widget _buildBody() {
    return Center(
      child:
          notes.isEmpty
              ? const Text('No Notes yet')
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return _buildListCard(note);
                },
              ),
    );
  }

  Widget _buildListCard(NoteModel note) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                note.title!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(note.content!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFabButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add Note"),
              content: Form(key: key, child: _buildTextFiled()),
              actions: [_buildCancelButton(), _buildAddButton()],
            );
          },
        );
      },
      tooltip: 'Create Note',
      child: const Icon(Icons.add),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton(
      onPressed: () async {
        if (key.currentState!.validate()) {
          NoteModel newNote = NoteModel(
            _titleController.text.toString(),
            _contentController.text.toString(),
          ); //creating object
          if (isHive) {
            await noteBox.put(notes.length + 1, newNote).whenComplete(() {
              setState(() {
                notes.add(newNote);
              });
            });
          } else {
            noteDb.create(newNote).whenComplete(() {
              noteDb.readAll().then((value) {
                setState(() {
                  notes = value;
                });
              });
            });
          }
          _titleController.clear();
          _contentController.clear();
          Navigator.pop(context);
        }
      },
      child: Text("Add"),
    );
  }

  Widget _buildCancelButton() {
    return ElevatedButton(
      onPressed: () {
        _titleController.clear();
        _contentController.clear();
        Navigator.pop(context);
      },
      child: Text("Cancel"),
    );
  }

  Widget _buildTextFiled() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.title),
            hintText: "Add Title",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "Enter Title";
            }
            return null;
          },
        ),
        TextFormField(
          controller: _contentController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.content_paste_sharp),
            hintText: "Add Content",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "Enter Content";
            }
            return null;
          },
        ),
      ],
    );
  }
}
