import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1_app/dialog/registraion_successful.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

Stream<User?> get userChecker {
  return _auth.authStateChanges();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Future<bool> registerUser(
      String email, String password, String name, String url) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      //user.updateProfile(displayName: name, photoURL: url);
      user?.updateDisplayName(name);
      user?.updatePhotoURL(url);

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final photoURLController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTRATION',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: Column(
                children: [
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
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                      focusColor: Colors.grey[200],
                      hoverColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Display Name',
                      fillColor: Colors.grey[200],
                      filled: true,
                      focusColor: Colors.grey[200],
                      hoverColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: photoURLController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Photo URL',
                      fillColor: Colors.grey[200],
                      filled: true,
                      focusColor: Colors.grey[200],
                      hoverColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
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
                        final name = nameController.text.toString().trim();
                        final url = photoURLController.text.toString().trim();

                        bool result =
                            await registerUser(email, password, name, url);

                        if (result) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return RegistrationDialog();
                            },
                          );
                          //Navigator.pushReplacementNamed(context, '/login');
                        } else {
                          print('Error');
                        }
                      },
                      child: Text('Register'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 160,
                  ),
                  Text('Already have an account?'),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
