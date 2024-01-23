import 'package:edu/widgets/my_app_bar.dart';
import 'package:edu/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class NoteAddingScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustAppBar("Заметка", context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          TextField(
              controller: _controller,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                //label style
                hintText: "Название заметки",
                hintStyle: TextStyle(color: Colors.grey[400]),

                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  enableFeedback: false,
                  onPressed: () {
                    _controller.clear();
                  },
                  icon: Icon(
                    Icons.clear,
                    size: 25,
                    color: Colors.black,
                  ),
                ),

                //border style
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 4, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.grey, //<-- SEE HERE
                  ),
                ),
              )),
          TextField(
            maxLines: null,
            style: TextStyle(fontSize: 25),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Введи конспект",
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                hintMaxLines: 20),
          ),
        ]),
      ),
    );
  }
}
