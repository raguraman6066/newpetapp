import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../client page/client page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formkey = GlobalKey<FormState>();
  String loginMailId = '';
  String loginPassword = '';
  bool hidePassword = true;

  static FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> signIn() async {
    String user = (await auth
        .signInWithEmailAndPassword(email: loginMailId, password: loginPassword)
        .catchError((err) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text(err.message),
                  actions: [
                    TextButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        })
        .then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ClientPage()),
            (route) => false))
        .toString());
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formkey,
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Pet Boarding',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.brown[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'YOUR PET SAFE WITH US',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.brown[600],
                  ),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter email address';
                      }

                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => loginMailId = value,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: hidePassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter password';
                      }
                      if (value!.trim().length < 4) {
                        return 'Please enter correct password';
                      }
                      // Return null if the entered password is valid
                      return null;
                    },
                    // obscureText: true,
                    onChanged: (value) => loginPassword = value,
                  ),
                ),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          signIn();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 3, primary: Colors.orange[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
