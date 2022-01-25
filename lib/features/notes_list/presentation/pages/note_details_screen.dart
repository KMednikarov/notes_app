import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatelessWidget {
  static var routeName = "/note-details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text('Note details'),
      ),
    );
  }
}
