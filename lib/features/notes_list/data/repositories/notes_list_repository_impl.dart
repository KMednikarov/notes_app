import 'package:notes_app/core/errors/exceptions.dart';
import 'package:notes_app/features/notes_list/data/datasources/local_data_source.dart';
import 'package:notes_app/features/notes_list/data/models/note.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';
import 'package:notes_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_app/features/notes_list/domain/repositories/notes_list_repository.dart';

class NotesListRepositoryImpl extends NotesListRepository {
  final LocalDataSource localDataSource;
  List<Note> _notes = [];

  NotesListRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<NoteItem>>> getNotesList() async {
    try {
      _notes = await localDataSource.getNotes();
      return Right(_notes);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<bool> saveNotesList() {
    return localDataSource.saveNotes(_notes);
  }

  @override
  Future<bool> saveNotes(NoteItem note) {
    Note newNote = Note(
        id: DateTime.now().toIso8601String(),
        text: note.text,
        title: note.title,
        categoryColor: note.color);
    _notes.add(newNote);
    return saveNotesList();
  }
}
