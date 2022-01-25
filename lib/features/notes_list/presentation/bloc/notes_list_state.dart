part of 'notes_list_bloc.dart';

abstract class NotesListState extends Equatable {
  const NotesListState();  

  @override
  List<Object> get props => [];
}
class NotesListInitial extends NotesListState {}
