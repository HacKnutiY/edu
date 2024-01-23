import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchField extends StatelessWidget {
  String? _labelText;
  String _prefixText = "";
  int? _lengthLimit = 30;
  TextEditingController _controller;

  SearchField(
    this._labelText,
    this._controller,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return TextField(
        controller: _controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(_lengthLimit),
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          
          //label style
          hintText: _labelText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          //suffixIcon style
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
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              width: 2, color: Colors.grey, //<-- SEE HERE
            ),
          ),
        ));
  }
}
