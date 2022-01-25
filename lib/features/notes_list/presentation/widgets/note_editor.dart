import 'package:flutter/material.dart';

class NoteEditor extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
          controller: _titleController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Title',
            focusColor: Theme.of(context).accentColor,
          )),
      TextField(
        controller: _contentController,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    ]);
  }
}
