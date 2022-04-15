import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc() : super(AddNoteInitial()) {
    on<AddNoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
