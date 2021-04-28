import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'note.dart';

class NotesStream extends StatelessWidget {
  final FirebaseFirestore firestore;
  final TextEditingController noteController = TextEditingController();
  NotesStream({this.firestore});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('notes').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Wait!');
        }
        final notes = snapshot.data.docs;
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              String id = notes[index].id;
              return Note(
                key: ValueKey(notes[index]),
                isTrue: notes[index].data()['isChecked'],
                title: notes[index].data()['text'],
                onCardTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        noteController.text = notes[index].data()['text'];
                        return Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                  controller: noteController,
                                  decoration: InputDecoration(),
                                ),
                                SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: () {
                                    firestore
                                        .collection('notes')
                                        .doc(id)
                                        .update({'text': noteController.text});
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save note'),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                onDismissed: (dismiss) {
                  firestore.collection('notes').doc(id).delete();
                },
                onCheckboxChanged: (value) {
                  bool myValue = !notes[index].data()['isChecked'];
                  firestore
                      .collection('notes')
                      .doc(id)
                      .update({'isChecked': myValue});
                },
              );
            });
      },
    );
  }
}
