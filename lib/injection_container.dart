import 'package:get_it/get_it.dart';
import 'package:notes_app/features/notes_list/data/datasources/local_data_source.dart';
import 'package:notes_app/features/notes_list/data/repositories/notes_list_repository_impl.dart';
import 'package:notes_app/features/notes_list/domain/repositories/notes_list_repository.dart';
import 'package:notes_app/features/notes_list/domain/usecases/get_notes_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/notes_list/domain/usecases/save_note.dart';
import 'features/notes_list/presentation/bloc/notes_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features
  getIt.registerFactory(
      () => NotesListBloc(getNotesList: getIt(), saveNote: getIt()));
  //UseCase
  getIt.registerLazySingleton(() => GetNotesList(repository: getIt()));
  getIt.registerLazySingleton(() => SaveNote(repository: getIt()));

  //Repository
  getIt
      .registerLazySingleton<NotesListRepository>(() => NotesListRepositoryImpl(
            localDataSource: getIt(),
          ));

  //Data sources
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(
        sharedPreferences: getIt(),
      ));

  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
