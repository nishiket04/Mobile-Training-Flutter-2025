import 'package:sqflite/sqflite.dart';

import '../presntation/sqlite/note_filed.dart';
import '../presntation/sqlite/note_model.dart';

class SqliteHelper{
  static final SqliteHelper instance = SqliteHelper._internal();

  static Database? _database;

  SqliteHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = "$databasePath/notes.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createFDatabase,
    );
  }

  Future<void> _createFDatabase(Database db, _) async{
    return await db.execute('''
        CREATE TABLE ${NoteFields.tableName} (
          ${NoteFields.id} ${NoteFields.idType},
          ${NoteFields.title} ${NoteFields.textType},
          ${NoteFields.content} ${NoteFields.textType}
        )
      ''');
  }

  Future<NoteModel> create(NoteModel note) async {
    final db = await instance.database;
    final id = await db.insert(NoteFields.tableName, note.toJson());
    return note.copy(id: id);
  }

  Future<List<NoteModel>> readAll() async {
    final db = await instance.database;
    final result = await db.query(NoteFields.tableName);
    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

  Future<void> close() async{
    final db = await instance.database;
    if(db.isOpen){
      db.close();
    }
  }

}