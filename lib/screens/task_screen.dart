import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_flutter/screens/registration_screen.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController taskController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskController,
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
                _firestore
                    .collection('users')
                    .doc(auth.currentUser.uid)
                    .collection('tasks')
                    .add({
                  'isChecked': false,
                  'text': taskController.text,
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
