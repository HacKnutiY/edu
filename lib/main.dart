import 'package:edu/routes/add_note_screen.dart';
import 'package:edu/routes/folders_data_screen.dart';
import 'package:edu/routes/home.dart';
import 'package:edu/routes/notes_folders_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home/': (context) => HomeScreen(),
        '/home/notes_folders/': (context) => NotesFoldersScreen(),
        '/home/notes_folders/folder_data/': (context) => FolderDataScreen(),
        '/home/notes_folders/folder_data/add_note/': (context) =>
            NoteAddingScreen(),
      },
      initialRoute: '/home/',
    );
  }
}
