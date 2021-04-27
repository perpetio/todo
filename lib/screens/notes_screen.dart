import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/note_state.dart';
import 'package:todo_list_flutter/screens/note_screen.dart';
import 'package:todo_list_flutter/widgets/note.dart';

List<NoteState> notes = [
  NoteState(isChecked: true, text: 'My noteeeee'),
  NoteState(isChecked: false, text: 'My noteeeee'),
  NoteState(isChecked: true, text: 'My noteeeee'),
];

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  String currText;

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
      body: Container(
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Note(
                isTrue: notes[index].isChecked,
                title: notes[index].text,
                onChanged: (value) {
                  setState(() {
                    notes[index].changeState();
                  });
                },
              );
            }),
      ),
    );
  }
}
