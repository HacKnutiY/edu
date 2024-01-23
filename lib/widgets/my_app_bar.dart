import 'package:flutter/material.dart';

PreferredSizeWidget? getCustAppBar(String title, context) {
  // TODO: implement build

  return AppBar(
    title: Text(title,
        style: TextStyle(
            color: Colors.black, fontSize: 38, fontWeight: FontWeight.w600)),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 38,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
