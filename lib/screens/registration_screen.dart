import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: [
          TextField(),
          SizedBox(
            height: 20.0,
          ),
          TextField(),
          SizedBox(
            height: 35.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
