import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/note_state.dart';
import 'notes_screen.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  String text;
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
              onChanged: (value) {
                text = value;
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  notes.add(NoteState(text: text));
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
