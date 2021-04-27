import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String title;
  final bool isTrue;
  final Function onChanged;
  Note({this.isTrue, this.title, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.0),
      child: Card(
        child: CheckboxListTile(
          value: isTrue,
          onChanged: onChanged,
          title: Text(title),
        ),
      ),
    );
  }
}
