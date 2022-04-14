import 'package:dartz/dartz.dart';
import 'package:notes_app/core/errors/failures.dart';
import 'package:notes_app/features/notes_list/data/models/note.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';

abstract class NotesListRepository {
  Future<Either<Failure, List<NoteItem>>> getNotesList();
  Future<void> saveNotesList();
  Future<bool> saveNotes(NoteItem note);
}
