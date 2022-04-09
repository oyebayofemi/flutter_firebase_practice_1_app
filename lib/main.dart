import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1_app/screens/homescreen.dart';
import 'package:firebase_practice_1_app/screens/login.dart';
import 'package:firebase_practice_1_app/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<User?>.value(
    value: userChecker,
    initialData: null,
    catchError: (User, Users) => null,
    child: MaterialApp(
      //home: RegistrationPage(),
      initialRoute: '/registration',
      routes: {
        '/registration': (context) => RegistrationPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
      },
    ),
  ));
}
