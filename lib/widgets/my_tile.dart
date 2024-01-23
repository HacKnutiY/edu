import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  String _tileName;
  dynamic _tilePicture;
  Color borderColor;
  VoidCallback? _onTap;
  bool isDateVisible;

  TileWidget(
    this._tileName,
    this._tilePicture, {
    this.borderColor = Colors.black,
    onPressed,
    dateTime,
    this.isDateVisible = false,
  }) {
    this._onTap = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour, DateTime.now().minute);
    String dateString = date.toString().replaceAll(":00.000", "");
    Widget _dateText(bool isDateVis) {
      if (isDateVis) {
        return Text(
          "[$dateString]",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 3),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _tileName,
                  style: TextStyle(fontSize: 32),
                ),
                _dateText(isDateVisible),
              ],
            ),
            _tilePicture,
          ],
        ),
      ),
    );
  }
}
