import 'package:edu/widgets/my_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Edu",
            style: TextStyle(
                color: Colors.black, fontSize: 45, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(children: [
              TileWidget(
                "Конспекты",
                Image(
                  color: Color.fromARGB(255, 0, 0, 0),
                  image: AssetImage('assets/imgs/note_icon.png'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home/notes_folders/');
                }, 
              ),
              TileWidget(
                "Карточки",
                Image(
                  color: Color.fromARGB(255, 0, 0, 0),
                  image: AssetImage('assets/imgs/cards_icon.png'),
                ),
              ),
              TileWidget(
                "Удаленное",
                Image(
                  color: Color.fromARGB(255, 0, 0, 0),
                  image: AssetImage('assets/imgs/trash_icon.png'),
                ),
                borderColor: const Color.fromARGB(255, 255, 22, 5),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
/*Image(
            color: const Color.fromARGB(255, 255, 255, 255),
            image: AssetImage('assets/imgs/trash_icon.png'),
          )*/








/*Image(
                image: AssetImage('assets/imgs/note_icon.png'),
              )*/