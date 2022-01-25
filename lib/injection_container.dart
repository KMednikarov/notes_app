import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/notes_list/presentation/bloc/notes_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features
  getIt.registerFactory(() => NotesListBloc());
  //UseCase

  //Repository

  //Data sources

  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
