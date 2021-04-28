import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController noteController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: noteController,
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: () {
                //used to save notes locally
                // setState(() {
                //   notes.add(NoteState(text: noteController.text));
                // });
                _firestore.collection('notes').add({
                  'isChecked': false,
                  'text': noteController.text,
                  'time': DateTime.parse(DateTime.now().toString())
                      .millisecondsSinceEpoch,
                });
                Navigator.pop(context);
              },
              child: Text('Add note'),
            ),
          ],
        ),
      ),
    );
  }
}
