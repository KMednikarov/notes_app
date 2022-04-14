part of 'notes_list_bloc.dart';

abstract class NotesListState extends Equatable {
  const NotesListState();

  @override
  List<Object> get props => [];
}

class NotesListInitial extends NotesListState {}

class NotesListFound extends NotesListState {
  final List<NoteItem> notesList;

  NotesListFound({
    required this.notesList,
  });

  @override
  // TODO: implement props
  List<Object> get props => [notesList];
}

class NoteSaved extends NotesListState {
  final bool success;

  NoteSaved({required this.success});
}

class NotesListError extends NotesListState {
  final String message;

  NotesListError({
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
