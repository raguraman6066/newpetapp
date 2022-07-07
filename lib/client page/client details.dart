import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pet page/pet page.dart';

class ClientDetail extends StatefulWidget {
  @override
  _ClientDetailState createState() => _ClientDetailState();
}

class _ClientDetailState extends State<ClientDetail> {
  String name = '';

  String address = '';

  String mobile = '';

  String email = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Client").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return Container(
            // color: Colors.teal[50],
            child: ListView(
                children: documents
                    .map((doc) => Card(
                          child: Container(
                            color: Colors.orange[200],
                            child: ListTile(
                              onTap: () {
                                var doc_id = doc.id;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PetPage(
                                            clientid: doc_id,
                                          )),
                                );
                              },
                              title: Text(doc['Name']),
                              subtitle: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(doc['Email']),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(doc['Mobile']),
                                  ],
                                ),
                              ) /*Text(doc['Email'] + '\n' + doc['Mobile'])*/,
                              trailing: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  print(doc['Name']);
                                  name = doc['Name'];
                                  address = doc['Address'];
                                  mobile = doc['Mobile'];
                                  email = doc['Email'];
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          'Client Information',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .orange[900],
                                                            fontSize: 25.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20.0,
                                                          width: 150.0,
                                                          child: Divider(
                                                            color: Colors
                                                                .brown[600],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        TextFormField(
                                                          initialValue: name,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'Owner Name',
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty) {
                                                              return 'Owner name can\'t be empty';
                                                            }

                                                            if (!(value!
                                                                    .length >
                                                                3)) {
                                                              return 'Please send valid Owner name';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) =>
                                                              name = value,
                                                        ),
                                                        SizedBox(
                                                          height: 15.0,
                                                        ),
                                                        TextFormField(
                                                          initialValue: address,
                                                          keyboardType:
                                                              TextInputType
                                                                  .streetAddress,
                                                          maxLines: 2,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'Address',
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty) {
                                                              return 'Address name can\'t be empty';
                                                            }

                                                            if (!(value!
                                                                    .length >
                                                                15)) {
                                                              return 'Please enter full address';
                                                            }

                                                            return null;
                                                          },
                                                          onChanged: (value) =>
                                                              address = value,
                                                        ),
                                                        SizedBox(
                                                          height: 15.0,
                                                        ),
                                                        TextFormField(
                                                          initialValue: mobile,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText: 'Mobile',
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty) {
                                                              return 'Mobile number can\'t be empty';
                                                            }

                                                            if (!(value
                                                                    .length ==
                                                                10)) {
                                                              return 'Please enter valid mobile number';
                                                            }
// Return null if the entered email is valid
                                                            return null;
                                                          },
                                                          onChanged: (value) =>
                                                              mobile = value,
                                                        ),
                                                        SizedBox(
                                                          height: 15.0,
                                                        ),
                                                        TextFormField(
                                                          initialValue: email,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText: 'Email',
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty) {
                                                              return 'Please enter your email address';
                                                            }
                                                            // Check if the entered email has the right format
                                                            if (!RegExp(
                                                                    r'\S+@\S+\.\S+')
                                                                .hasMatch(
                                                                    value!)) {
                                                              return 'Please enter a valid email address';
                                                            }
                                                            // Return null if the entered email is valid
                                                            return null;
                                                          },
                                                          onChanged: (value) =>
                                                              email = value,
                                                        ),
                                                        SizedBox(
                                                          height: 13.0,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                final isValid = _formKey
                                                                    .currentState!
                                                                    .validate();
                                                                if (isValid) {
                                                                  print(doc.id);
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'Client')
                                                                      .doc(doc
                                                                          .id)
                                                                      .update(
                                                                        {
                                                                          'Name':
                                                                              name,
                                                                          'Email':
                                                                              email,
                                                                          'Mobile':
                                                                              mobile,
                                                                          'Address':
                                                                              address,
                                                                        },
                                                                      )
                                                                      .then((value) =>
                                                                          Navigator.pop(
                                                                              context))
                                                                      .then((value) =>
                                                                          print(
                                                                              'update'));
                                                                }
                                                              },
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                                child: Text(
                                                                  'Update',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0),
                                                                ),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary: Colors
                                                                              .orange[
                                                                          700]),
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
                              ),
                            ),
                          ),
                        ))
                    .toList()),
          );
        } else if (snapshot.hasData) {
          return Text('Loading...');
        }
        return Center(child: Container(child: CircularProgressIndicator()));
      },
    );
  }
}
