import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1_app/screens/homescreen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool switched = false;

  Future<User?> login(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue,
                        letterSpacing: 1.0,
                        fontSize: 37,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.grey[200],
                        focusColor: Colors.grey[200],
                        hoverColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.grey[200],
                        focusColor: Colors.grey[200],
                        hoverColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Remeber me'),
                      Switch(
                          value: switched,
                          inactiveTrackColor: Colors.red[200],
                          activeColor: Colors.red[900],
                          onChanged: (value) {
                            setState(() {
                              switched = value;
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: FlatButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () async {
                        final email = emailController.text.toString().trim();
                        final password =
                            passwordController.text.toString().trim();

                        User? user = await login(email, password);

                        if (user != null) {
                          /*Navigator.pushReplacementNamed(context, '/home',
                              arguments: {
                                'name': user.displayName,
                                'url': user.photoURL,
                              });*/

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    name: user.displayName,
                                    url: user.photoURL,
                                  )));
                        } else {
                          print('error');
                        }
                      },
                      child: Text('Login'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('I dont have an account?'),
                  FlatButton(
                      splashColor: Colors.green,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/registration');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
