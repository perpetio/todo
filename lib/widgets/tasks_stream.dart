import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_flutter/screens/registration_screen.dart';

import 'task.dart';

class TasksStream extends StatelessWidget {
  final FirebaseFirestore firestore;
  final TextEditingController taskController = TextEditingController();
  TasksStream({this.firestore});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection('users')
          .doc(auth.currentUser.uid)
          .collection('tasks')
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text('Wait!'));
        }
        final tasks = snapshot.data.docs;
        return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              String id = tasks[index].id;
              return Note(
                key: ValueKey(tasks[index]),
                isTrue: tasks[index].data()['isChecked'],
                title: tasks[index].data()['text'],
                onCardTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        taskController.text = tasks[index].data()['text'];
                        return Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                  controller: taskController,
                                  decoration: InputDecoration(),
                                ),
                                SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: () {
                                    firestore
                                        .collection('users')
                                        .doc(auth.currentUser.uid)
                                        .collection('tasks')
                                        .doc(id)
                                        .update({'text': taskController.text});
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
                  firestore
                      .collection('users')
                      .doc(auth.currentUser.uid)
                      .collection('tasks')
                      .doc(id)
                      .delete();
                },
                onCheckboxChanged: (value) {
                  bool myValue = !tasks[index].data()['isChecked'];
                  firestore
                      .collection('users')
                      .doc(auth.currentUser.uid)
                      .collection('tasks')
                      .doc(id)
                      .update({'isChecked': myValue});
                },
              );
            });
      },
    );
  }
}
