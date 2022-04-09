import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final name;
  final url;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  HomeScreen({this.name, this.url});

  Future signout() async {
    return _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await signout();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Signout'))
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You have logged in successfully',
                style: TextStyle(fontSize: 32, color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your name is $name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Your Url is $url',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
