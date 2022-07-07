import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login page/login.dart';
import 'client details.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      saveClientData();
    }
  }

  String name = '';
  String address = '';
  String mobile = '';
  String email = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_circle,
          size: 30.0,
        ),
        title: Text(
          'Client Details',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Alert',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: const Text('Do you want to logout'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => FirebaseAuth.instance.signOut().then(
                          (value) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false)),
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ClientDetail(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: SafeArea(
                          child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Client Registration',
                                  style: TextStyle(
                                    color: Colors.orange[900],
                                    fontSize: 25.0,
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
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Owner Name',
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Owner name can\'t be empty';
                                    }

                                    if (!(value.length > 3)) {
                                      return 'Please send valid Owner name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => name = value,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.streetAddress,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Address',
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Address name can\'t be empty';
                                    }

                                    if (!(value.length > 15)) {
                                      return 'Please enter full address';
                                    }

                                    return null;
                                  },
                                  onChanged: (value) => address = value,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Mobile',
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Mobile number can\'t be empty';
                                    }

                                    if (!(value!.length == 10)) {
                                      return 'Please enter valid mobile number';
                                    }

                                    return null;
                                  },
                                  onChanged: (value) => mobile = value,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    // Check if the entered email has the right format
                                    if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value!)) {
                                      return 'Please enter a valid email address';
                                    }
                                    // Return null if the entered email is valid
                                    return null;
                                  },
                                  onChanged: (value) => email = value,
                                ),
                                SizedBox(
                                  height: 13.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        _submitForm();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          'Register',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.orange[700]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Map<String, dynamic> clientData = {};
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Client');
  saveClientData() {
    clientData = {
      'Name': name,
      'Address': address,
      'Mobile': mobile,
      'Email': email,
    };
    collectionReference
        .add(clientData)
        .then((value) => print(value.id))
        .then((value) => Navigator.pop(context));
  }
}
