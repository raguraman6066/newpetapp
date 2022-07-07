import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pet form/edit petform.dart';
import '../pet form/fill petform.dart';

class PetPage extends StatefulWidget {
  String clientid;

  PetPage({required this.clientid});
  @override
  _PetPageState createState() => _PetPageState(clientid);
}

class _PetPageState extends State<PetPage> {
  String clientid;
  _PetPageState(this.clientid);
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Client');
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          flexibleSpace: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.pets,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Pet Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi, $getownername',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5.0,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Client Details',
                                      style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 20.0,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Colors.brown[900],
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            getownername,
                                            style: TextStyle(
                                              color: Colors.brown[900],
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          color: Colors.brown[900],
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Flexible(
                                            child: Text(
                                          getemail,
                                          style: TextStyle(
                                            color: Colors.brown[900],
                                            fontSize: 18,
                                          ),
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Colors.brown[900],
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            getmobile,
                                            style: TextStyle(
                                              color: Colors.brown[900],
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 27.0,
                                          color: Colors.brown[900],
                                        ),
                                        Flexible(
                                          child: Text(
                                            getaddress,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              color: Colors.brown[900],
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ));
                },
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PetDetails(
        petdetailid: clientid,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PetFormPage(
                      petstoreid: clientid,
                    )),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String getownername = '';
  String getemail = '';
  String getaddress = '';
  String getmobile = '';

  // String? uidd;
  void getClientData() {
    String uid = auth.currentUser!.uid.toString();
    // uidd = 'NeLxSHaHB6aVhKGxIsuB';
    FirebaseFirestore.instance
        .collection('Client')
        .doc(clientid)
        .get()
        .then((value) {
      print(value.data());
      setState(() {
        getownername = value.data()!["Name"];
        getemail = value.data()!['Email'];
        getaddress = value.data()!["Address"];
        getmobile = value.data()!['Mobile'];
      });
    });
  }

  @override
  void initState() {
    getClientData();
    // TODO: implement initState
    super.initState();
  }
}

class PetDetails extends StatelessWidget {
  String petdetailid;
  PetDetails({required this.petdetailid});
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = petdetailid;

    // <1> Use StreamBuilder
    return StreamBuilder<QuerySnapshot>(
      // <2> Pass `Stream<QuerySnapshot>` to stream
      stream: FirebaseFirestore.instance
          .collection("Pet Details")
          .doc(uid)
          .collection('pet')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView(
              children: documents
                  .map((doc) => Card(
                        child: Container(
                          color: Colors.orangeAccent[100],
                          child: ListTile(
                            title: Text(doc['petname']),
                            subtitle: Text(doc['petbreed']),
                            trailing: IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {
                                var doc_id = doc.id;
                                print(uid);
                                print(doc_id);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditFormPage(
                                            userid: uid,
                                            userpetid: doc_id,
                                          )),
                                );
                              },
                            ),
                          ),
                        ),
                      ))
                  .toList());
        } else if (snapshot.hasData) {
          return Text('It\'s Error!');
        }
        return Center(child: Container(child: CircularProgressIndicator()));
      },
    );
  }
}
