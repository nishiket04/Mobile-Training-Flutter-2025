import 'package:hive/hive.dart';

import 'note_filed.dart';
part "note_model.g.dart";

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? content;

  const NoteModel(this.title, this.content,[this.id]);

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.content: content,
  };

  factory NoteModel.fromJson(Map<String, Object?> json) {
    final id = json[NoteFields.id] as int;
    final title = json[NoteFields.title] as String;
    final content = json[NoteFields.content] as String;
    return NoteModel(title,content,id);
  }

  NoteModel copy({int? id, String? title, String? content}) {
    return NoteModel(
      title ?? this.title,
      content ?? this.content,
      id ?? this.id,
    );
  }
}
