import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/core/base/use_case.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';
import 'package:notes_app/features/notes_list/domain/usecases/get_notes_list.dart';

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  final GetNotesList getNotesList;
  NotesListBloc({required this.getNotesList}) : super(NotesListInitial()) {
    on<NotesListEvent>((event, emit) async* {
      if (event is NotesListEvent) {
        yield NotesListInitial();
        final result = await getNotesList(NoParams());
        yield result.fold((error) => NotesListError(message: error.message),
            (notes) => NotesListFound(notesList: notes));
      }
    });
  }
}
