import 'package:equatable/equatable.dart';
import 'package:notes_app/core/base/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_app/core/base/use_case.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';
import 'package:notes_app/features/notes_list/domain/repositories/notes_list_repository.dart';

class GetNotesList extends UseCase<List<NoteItem>, NoParams> {
  final NotesListRepository repository;

  GetNotesList({required this.repository});

  @override
  Future<Either<Failure, List<NoteItem>>> call(params) async {
    return await repository.getNotesList();
  }
}

class Params extends Equatable {
  final String text;

  Params({required this.text});

  @override
  List<Object?> get props => [
        text,
      ];
}
