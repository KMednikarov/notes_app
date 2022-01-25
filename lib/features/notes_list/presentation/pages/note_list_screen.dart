import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
