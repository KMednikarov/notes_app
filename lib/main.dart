import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './notes_app.dart';
import './injection_container.dart' as di;
import 'features/notes_list/presentation/bloc/notes_list_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (_) => di.getIt<NotesListBloc>())],
    child: NotesApp(),
  ));
}

// ignore: must_be_immutable

