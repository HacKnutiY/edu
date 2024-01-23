import 'package:edu/widgets/my_app_bar.dart';
import 'package:edu/widgets/my_textfield.dart';
import 'package:edu/widgets/my_tile.dart';
import 'package:flutter/material.dart';

class FolderDataScreen extends StatelessWidget {
  final TextEditingController _searchFieldController = TextEditingController();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    String _folderName = settings.arguments.toString();
    Widget addNoteButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context, '/home/notes_folders/folder_data/add_note/');
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "+",
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0), fontSize: 50),
          ),
          alignment: Alignment.center,
        ),
      );
    }

    return Scaffold(
      appBar: getCustAppBar(_folderName, context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SearchField("Найти заметку", _searchFieldController),
            SizedBox(
              height: 20,
            ),
            TileWidget(
              "Note name",
              Image(
                image: AssetImage('assets/imgs/note_icon.png'),
                color: Colors.black,
              ),
              isDateVisible: true,
            ),
            addNoteButton(),
          ],
        ),
      ),
    );
  }
}
