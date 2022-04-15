import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';

class Note extends NoteItem {
  final String id;
  final String title;
  final String text;
  final Color categoryColor;

  Note({
    required this.id,
    required this.title,
    required this.text,
    required this.categoryColor,
  }) : super(id: id, text: text, title: title, color: categoryColor);

  factory Note.fromJson(Map<String, dynamic> res) {
    return Note(
      id: res['id'],
      title: res['title'],
      text: res['text'],
      categoryColor: Color(res['color']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
        'color': categoryColor.value,
      };
  static String encode(List<Note> notes) => json.encode(
        notes.map<Map<String, dynamic>>((note) => note.toJson()).toList(),
      );

  static List<Note> decode(String notes) {
    final decoded = jsonDecode(notes);
    return (json.decode(decoded) as List<dynamic>)
        .map<Note>((item) => Note.fromJson(item))
        .toList();
  }
}
