import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_list/data/models/note.dart';
import 'package:notes_app/features/notes_list/presentation/pages/note_details_screen.dart';

// ignore: must_be_immutable
class NoteCard extends StatelessWidget {
  Note _note;
  NoteCard(this._note);

  void onNoteTapped(BuildContext context) {
    Navigator.of(context)
        .pushNamed(NoteDetailsScreen.routeName, arguments: _note.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        highlightColor: Theme.of(context).hoverColor,
        splashColor: Theme.of(context).accentColor,
        onTap: () {
          onNoteTapped(context);
        },
        child: Container(
          decoration: categoryDecoration(_note.categoryColor),
          height: 80,
          padding:
              const EdgeInsets.only(left: 10, top: 15, right: 5, bottom: 5),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _note.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Text(
                      _note.text,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration categoryDecoration(Color color) {
    return BoxDecoration(
      gradient: LinearGradient(
          colors: [color, Colors.transparent], stops: [0.015, 0.015]),
      borderRadius: BorderRadius.all(
        const Radius.circular(2.0),
      ),
    );
  }
}
