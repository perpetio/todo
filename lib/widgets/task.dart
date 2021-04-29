import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final Key key;
  final String title;
  final bool isTrue;
  final Function onCheckboxChanged;
  final Function onDismissed;
  final Function onCardTap;
  Note(
      {this.key,
      this.isTrue,
      this.title,
      this.onCheckboxChanged,
      this.onDismissed,
      this.onCardTap});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      background: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Icon(
              Icons.cancel,
              size: 40.0,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.0),
        child: Material(
          color: Colors.white,
          elevation: 2.0,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            onTap: onCardTap,
            child: ListTile(
              title: Text(title),
              trailing: Checkbox(
                value: isTrue,
                onChanged: onCheckboxChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
