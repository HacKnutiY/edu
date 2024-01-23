import 'package:edu/widgets/my_app_bar.dart';
import 'package:edu/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class NotesFoldersScreen extends StatelessWidget {
  final TextEditingController _searchFieldController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustAppBar("Конспекты", context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            SearchField("Найти папку", _searchFieldController),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NotesFolder(
                  "Общее",
                  () {
                    Navigator.pushNamed(
                        context, '/home/notes_folders/folder_data/',
                        arguments: "Общее");
                  },
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(150)),
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Widget getFoldersRow(){
  return 
}
*/
class NotesFolder extends StatelessWidget {
  String _folderName;
  VoidCallback _onPressed;
  NotesFolder(this._folderName, this._onPressed);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/imgs/folder_icon.png'),
            color: Colors.black,
          ),
          Text(
            _folderName,
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
