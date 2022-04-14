import 'dart:convert';

import 'package:notes_app/core/errors/exceptions.dart';
import 'package:notes_app/features/notes_list/data/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  final String _notesListKey = "notes_list_sp_key";
  Future<List<Note>> getNotes();
  Future<bool> saveNotes(List<Note> notes);
}

class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<Note>> getNotes() {
    final jsonString = sharedPreferences.getString(_notesListKey);
    if (jsonString != null) {
      final notes = Note.decode(jsonString);
      return Future.value(notes);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> saveNotes(List<Note> notes) {
    return sharedPreferences.setString(
      _notesListKey,
      json.encode(Note.encode(notes)),
    );
  }
}
