import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_app/core/base/use_case.dart';
import 'package:notes_app/features/notes_list/domain/entities/note_item.dart';
import 'package:notes_app/features/notes_list/domain/repositories/notes_list_repository.dart';

class SaveNote extends UseCase<bool, Params> {
  final NotesListRepository repository;

  SaveNote({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    NoteItem item = new NoteItem(
      id: DateTime.now().toIso8601String(),
      title: params.title,
      text: params.text,
      color: params.color,
    );

    final success = await repository.saveNotes(item);

    if (success) {
      return Right(success);
    }

    return Left(CacheFailure());
  }
}

class Params extends Equatable {
  final String title;
  final String text;
  final Color color;

  Params({required this.title, required this.text, required this.color});

  @override
  List<Object?> get props => [
        title,
        text,
      ];
}
