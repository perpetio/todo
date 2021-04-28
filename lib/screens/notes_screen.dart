import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_flutter/screens/note_screen.dart';
import 'package:todo_list_flutter/widgets/notes_stream.dart';

import 'registration_screen.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        User loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo list'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteScreen(),
              ));
        },
      ),
      body: NotesStream(
        firestore: firestore,
      ),
    );
  }
}
