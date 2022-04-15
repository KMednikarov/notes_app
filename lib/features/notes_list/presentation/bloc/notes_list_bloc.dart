import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/base/use_case.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';
import 'package:notes_app/features/notes_list/domain/usecases/get_notes_list.dart';
import 'package:notes_app/features/notes_list/domain/usecases/save_note.dart'
    as sn;

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  final GetNotesList getNotesList;
  final sn.SaveNote saveNote;

  NotesListBloc({required this.getNotesList, required this.saveNote})
      : super(NotesListInitial()) {
    on<GetNotesListEvent>(_onGetNotesList);
    on<SaveNoteEvent>(_onNoteSaved);
  }

  Future<void> _onNoteSaved(
      SaveNoteEvent event, Emitter<NotesListState> emit) async {
    final sn.Params params =
        sn.Params(title: event.title, text: event.text, color: event.color);

    final result = await saveNote(params);
    result.fold((error) => emit(NotesListError(message: error.message)),
        (success) => emit(NoteSaved(success: success)));
  }

  Future<void> _onGetNotesList(
      GetNotesListEvent event, Emitter<NotesListState> emit) async {
    emit(NotesListInitial());
    final result = await getNotesList(NoParams());
    result.fold((error) => emit(NotesListError(message: error.message)),
        (success) => emit(NotesListFound(notesList: success)));
  }
}
