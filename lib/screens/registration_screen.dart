import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_flutter/screens/tasks_screen.dart';

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ScaffoldFeatureController showRegisterExceptionSnackBar(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

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
                  final newUser = await auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (newUser != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TasksList()));
                    firestore
                        .collection('users')
                        .doc(newUser.user.uid)
                        .set({'email': newUser.user.email});
                  }
                } catch (e) {
                  print(e);
                  if (e.code == 'email-already-in-use') {
                    showRegisterExceptionSnackBar(context, 'Email is in use!');
                  } else if (e.code == 'invalid-email') {
                    showRegisterExceptionSnackBar(context, 'Email is invalid!');
                  }
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
