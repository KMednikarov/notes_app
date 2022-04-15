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
  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesListBloc>(context).add(GetNotesListEvent());
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
              return Text(state.notesList[0].text);
              // return ListView.builder(
              //   itemCount: state.notesList.length,
              //   itemBuilder: (ctx, index) {
              //     return ListTile(
              //       title: Text(state.notesList[index].title),
              //       subtitle: Text(state.notesList[index].text),
              //     );
              //   },
              // );
            } else if (state is NoteSaved) {
              BlocProvider.of<NotesListBloc>(context).add(GetNotesListEvent());

              return Text('Note saved');
            } else {
              return Text('Default');
            }
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Scaffold(
                      body: Column(
                        children: [
                          Text('Test'),
                          TextFormField(
                            controller: _titleController,
                            textInputAction: TextInputAction.done,
                          ),
                          TextFormField(
                            controller: _textController,
                            textInputAction: TextInputAction.next,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<NotesListBloc>(context).add(
                                    SaveNoteEvent(
                                        title: _titleController.text,
                                        text: _textController.text,
                                        color: Colors.green));
                              },
                              child: Text('Save')),
                        ],
                      ),
                    );
                  })
              .whenComplete(() => BlocProvider.of<NotesListBloc>(context)
                  .add(GetNotesListEvent()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
