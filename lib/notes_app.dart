import 'package:flutter/material.dart';

import 'core/assets/palette.dart';
import 'features/notes_list/presentation/pages/note_details_screen.dart';
import 'features/notes_list/presentation/pages/note_list_screen.dart';

class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hoverColor: Palette.secondaryColor.shade100,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.primaryColor)
            .copyWith(secondary: Palette.secondaryColor),
      ),
      initialRoute: NoteListScreen.routeName,
      routes: {
        '/': (ctx) => NoteListScreen(),
        NoteDetailsScreen.routeName: (ctx) => NoteDetailsScreen(),
      },
    );
  }
}
