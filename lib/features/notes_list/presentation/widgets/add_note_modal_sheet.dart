import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/features/notes_list/data/models/note.dart';
import 'package:notes_app/features/notes_list/presentation/widgets/color_picker.dart';

class AddNoteModalSheet extends StatefulWidget {
  @override
  _AddNoteModalSheetState createState() => _AddNoteModalSheetState();
}

class _AddNoteModalSheetState extends State<AddNoteModalSheet> {
  Color _selectedColor = Colors.transparent;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      // height: MediaQuery.of(context).size.height / 1.4,

      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: mediaQuery.viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ColorPicker(onColorChanged), buttonSaveNote(context)],
            ),
            textFieldTitle(context),
            Container(
              height: mediaQuery.size.height / 5,
              child: textFieldNoteText(),
            ),
          ],
        ),
      ),
    );
  }

  void onColorChanged(Color color) {
    _selectedColor = color;
  }

  Widget textFieldNoteText() {
    return TextField(
      controller: _contentController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(border: InputBorder.none),
    );
  }

  TextFormField textFieldTitle(BuildContext context) {
    return TextFormField(
      controller: _titleController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: 'Title', focusColor: Theme.of(context).accentColor),
    );
  }

  Container buttonSaveNote(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          _addNote(context);
        },
        child: Icon(Icons.check),
      ),
    );
  }

  // Container dropdownColorPicker() {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     child: DropdownButtonHideUnderline(
  //       child: DropdownButton(
  //           elevation: 2,
  //           iconSize: 0,
  //           value: _selectedColor,
  //           onChanged: (int? value) {
  //             setState(() {
  //               _selectedColor = value;
  //             });
  //           },
  //           items: _colors.entries
  //               .map((e) => DropdownMenuItem(
  //                     child: Container(
  //                       width: 20,
  //                       height: 20,
  //                       decoration: BoxDecoration(
  //                           color: e.value,
  //                           borderRadius: BorderRadius.circular(5)),
  //                     ),
  //                     value: e.key,
  //                   ))
  //               .toList()),
  //     ),
  //   );
  // }

  void _addNote(BuildContext context) {
    if (_contentController.text.isEmpty) {
      return;
    }
    Navigator.pop(context);

    final note = Note(
      id: DateTime.now().toIso8601String(),
      title: _titleController.text,
      text: _contentController.text,
      categoryColor: _selectedColor,
    );
  }
}
