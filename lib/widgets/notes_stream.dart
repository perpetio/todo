import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'note.dart';

class NotesStream extends StatelessWidget {
  final FirebaseFirestore firestore;
  NotesStream({this.firestore});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('notes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Wait!');
        }
        final notes = snapshot.data.docs;
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Note(
                isTrue: notes[index].data()['isChecked'],
                title: notes[index].data()['text'],
                onChanged: (value) {
                  String id = notes[index].id;
                  bool isTr = !notes[index].data()['isChecked'];
                  firestore
                      .collection('notes')
                      .doc(id)
                      .update({'isChecked': isTr});
                },
              );
            });
      },
    );
  }
}
