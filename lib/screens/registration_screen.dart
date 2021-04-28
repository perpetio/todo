import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_flutter/screens/notes_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: emailController,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: passwordController,
            ),
            SizedBox(
              height: 35.0,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (newUser != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotesList()));
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
