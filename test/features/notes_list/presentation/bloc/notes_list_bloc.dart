import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  NotesListBloc() : super(NotesListInitial()) {
    on<NotesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
