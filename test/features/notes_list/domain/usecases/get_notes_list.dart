import 'package:mocktail/mocktail.dart';
import 'package:notes_app/features/notes_list/domain/repositories/notes_list_repository.dart';
import 'package:notes_app/features/notes_list/domain/usecases/get_notes_list.dart';

class MockNotesListRepository extends Mock implements NotesListRepository {}

void main(List<String> args) {
  GetNotesList usecase = GetNotesList();
  MockNotesListRepository repository;
}
