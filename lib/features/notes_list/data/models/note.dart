import 'dart:convert';

import 'package:flutter/material.dart';

class Note {
  final String id;
  final String title;
  final String text;
  final Color categoryColor;

  const Note({
    required this.id,
    required this.title,
    required this.text,
    required this.categoryColor,
  });

  factory Note.fromJson(Map<String, dynamic> res) {
    return Note(
      id: res['id'],
      title: res['title'],
      text: res['text'],
      categoryColor: Color(res['color']),
    );
  }

  static Map<String, dynamic> toMap(Note note) => {
        'id': note.id,
        'title': note.title,
        'text': note.text,
        'color': note.categoryColor.value,
      };

  static String encode(List<Note> notes) => json.encode(
        notes.map<Map<String, dynamic>>((note) => Note.toMap(note)).toList(),
      );

  static List<Note> decode(String notes) =>
      (json.decode(notes) as List<dynamic>)
          .map<Note>((item) => Note.fromJson(item))
          .toList();
}
