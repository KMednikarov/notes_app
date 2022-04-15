part of 'notes_list_bloc.dart';

abstract class NotesListEvent extends Equatable {
  const NotesListEvent();

  @override
  List<Object> get props => [];
}

class GetNotesListEvent extends NotesListEvent {}

class SaveNoteEvent extends NotesListEvent {
  final String title;
  final String text;
  final Color color;

  SaveNoteEvent({
    required this.title,
    required this.text,
    required this.color,
  });
}
