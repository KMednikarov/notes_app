import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes_list/presentation/bloc/notes_list_bloc.dart';

import '../widgets/note_card.dart';

// ignore: must_be_immutable
class NoteListScreen extends StatefulWidget {
  static var routeName = '/';

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes list'),
      ),
      body: Column(
        children: [
          Text('Test'),
          BlocBuilder<NotesListBloc, NotesListState>(builder: (context, state) {
            if (state is NotesListInitial) {
              return Text('Initial');
            } else if (state is NotesListFound) {
              return ListView.builder(
                itemCount: state.notesList.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(state.notesList[index].title),
                    subtitle: Text(state.notesList[index].text),
                  );
                },
              );
            } else {
              return Text('Default');
            }
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
