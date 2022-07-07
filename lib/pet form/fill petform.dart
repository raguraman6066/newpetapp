import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../pet page/pet page.dart';
import '../reusable widget/reusable.dart';

class PetFormPage extends StatefulWidget {
  String petstoreid;

  PetFormPage({required this.petstoreid});
  @override
  _PetFormPageState createState() => _PetFormPageState(petstoreid);
}

class _PetFormPageState extends State<PetFormPage> {
  String todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  String petstoreid;

  _PetFormPageState(this.petstoreid);
  String selectedRole = 'Writer';

  FirebaseAuth auth = FirebaseAuth.instance;
// fields
  Object? ismedications = 'No';
  bool isVisible = false;

  Object? purpose = '';
  Object? petgender = '';
  Object? speynauter = '';
  bool isyourpet1 = false;
  bool isyourpet2 = false;
  bool isyourpet3 = false;
  bool isyourpet4 = false;
  bool isyourpet5 = false;
  bool isyourpet6 = false;
  bool isyourpet7 = false;
  bool isyourpet8 = false;
  bool isyourpet9 = false;
  Object? ispet1 = 'No';
  Object? ispet2 = 'No';
  Object? ispet3 = 'No';
  Object? ispet4 = 'No';
  Object? ispet5 = 'No';
  Object? ispet6 = 'No';
  Object? ispet7 = 'No';
  Object? ispet8 = 'No';
  Object? ispet9 = 'No';

  final fromdate = TextEditingController();
  final todate = TextEditingController();
  final petname = TextEditingController();
  final petbreed = TextEditingController();
  final petcolour = TextEditingController();
  final petdob = TextEditingController();
  final petweight = TextEditingController();

  final lastheat = TextEditingController();
  final nextheat = TextEditingController();
  final vetname = TextEditingController();
  final vetcontact = TextEditingController();
  final vettime = TextEditingController();
  final vetweekoff = TextEditingController();

  final rslast = TextEditingController();
  final rsnext = TextEditingController();

  final solast = TextEditingController();
  final sonext = TextEditingController();

  final balast = TextEditingController();
  final banext = TextEditingController();

  final delast = TextEditingController();
  final denext = TextEditingController();

  final detlast = TextEditingController();
  final detnext = TextEditingController();

  final aolast = TextEditingController();
  final aonext = TextEditingController();
  final medication1 = TextEditingController();
  final dosage1 = TextEditingController();
  final prescribe1 = TextEditingController();
  final medication2 = TextEditingController();
  final dosage2 = TextEditingController();
  final prescribe2 = TextEditingController();
  final medication3 = TextEditingController();
  final dosage3 = TextEditingController();
  final prescribe3 = TextEditingController();
  Object? petProne = '';
  Object? petTend = '';
  Object? parkDaycare = '';
  Object? petAround = '';
  Object? petDescribe = '';
  final petexcercise = TextEditingController();
  final ispet1rea = TextEditingController();
  final ispet2rea = TextEditingController();
  final ispet3rea = TextEditingController();
  final ispet4rea = TextEditingController();
  final ispet5rea = TextEditingController();
  final ispet6rea = TextEditingController();
  final ispet7rea = TextEditingController();
  final ispet8rea = TextEditingController();
  final illness = TextEditingController();
  var mrng = TextEditingController();
  var after = TextEditingController();
  var eve = TextEditingController();
  var nyt = TextEditingController();
  String morningTime = '';
  String afternoonTime = '';
  String EveningTime = '';
  String nightTime = '';

  Future<void> morning() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        morningTime = result.format(context);
        mrng.text = morningTime;
        print(mrng.text);
      });
    }
  }

  Future<void> afternoon() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        afternoonTime = result.format(context);
        after.text = afternoonTime;
      });
    }
  }

  Future<void> evening() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        EveningTime = result.format(context);
        eve.text = EveningTime;
      });
    }
  }

  Future<void> night() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        nightTime = result.format(context);
        nyt.text = nightTime;
      });
    }
  }

  final mrngdiet = TextEditingController();
  final mrngquant = TextEditingController();
  final afrndiet = TextEditingController();
  final afrnquant = TextEditingController();
  final evediet = TextEditingController();
  final evequant = TextEditingController();
  final nightdiet = TextEditingController();
  final nightquant = TextEditingController();
  final place = TextEditingController();

  final filleddate = TextEditingController();

  //other

  String _value1 = '';
  String _value2 = '';

  //end fields

  addPetDetails() {
    String storeid = petstoreid;
    FirebaseFirestore.instance
        .collection('Pet Details')
        .doc(storeid)
        .collection('pet')
        .add(
      {
        'purpose': purpose,
        'fromdate': fromdate.text,
        'todate': todate.text,
        'petname': petname.text,
        'petbreed': petbreed.text,
        'petcolor': petcolour.text,
        'petdob': petdob.text,
        'petgender': petgender,
        'spayneuter': speynauter,
        'petweight': petweight.text,
        'lastheat': lastheat.text,
        'nextheat': nextheat.text,
        'vetname': vetname.text,
        'vetmobile': vetcontact.text,
        'vettime': vettime.text,
        'vetweekoff': vetweekoff.text,
        'rslast': rslast.text,
        'rsnext': rsnext.text,
        'solast': solast.text,
        'sonext': sonext.text,
        'balast': balast.text,
        'banext': banext.text,
        'delast': delast.text,
        'denext': denext.text,
        'detlast': detlast.text,
        'detnext': detnext.text,
        'aolast': aolast.text,
        'aonext': aonext.text,
        'ismedication': ismedications,
        'medication1': medication1.text,
        'dosage1': dosage1.text,
        'prescribe1': prescribe1.text,
        'medication2': medication2.text,
        'dosage2': dosage2.text,
        'prescribe2': prescribe2.text,
        'medication3': medication3.text,
        'dosage3': dosage3.text,
        'prescribe3': prescribe3.text,
        'petProne': petProne,
        'petTend': petTend,
        'parkDaycare': parkDaycare,
        'petAround': petAround,
        'petDescribe': petDescribe,
        'petexcercise': petexcercise.text,
        'ispet1': ispet1,
        'ispet2': ispet2,
        'ispet3': ispet3,
        'ispet4': ispet4,
        'ispet5': ispet5,
        'ispet6': ispet6,
        'ispet7': ispet7,
        'ispet8': ispet8,
        'ispet9': ispet9,
        'ispet1rea': ispet1rea.text,
        'ispet2rea': ispet2rea.text,
        'ispet3rea': ispet3rea.text,
        'ispet4rea': ispet4rea.text,
        'ispet5rea': ispet5rea.text,
        'ispet6rea': ispet6rea.text,
        'ispet7rea': ispet7rea.text,
        'ispet8rea': ispet8rea.text,
        'illness': illness.text,
        'morningTime': mrng.text,
        'afternoonTime': after.text,
        'EveningTime': eve.text,
        'nightTime': nyt.text,
        'mrngdiet': mrngdiet.text,
        'mrngquant': mrngquant.text,
        'afrndiet': afrndiet.text,
        'afrnquant': afrnquant.text,
        'evediet': evediet.text,
        'evequant': evequant.text,
        'nightdiet': nightdiet.text,
        'nightquant': nightquant.text,
        'place': place.text,
        'filleddate': todaydate,
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit"),
      onPressed: () {
        addPetDetails();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => PetPage(
                      clientid: petstoreid,
                    )),
            ModalRoute.withName('/profile'));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Alert",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("Do you want to submit pet form"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Pet Information Form',
        subtitle: 'Please fill all the information about your pet',
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '1. PET INFORMATION',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Boarding',
                        groupValue: purpose,
                        onChanged: (value) {
                          setState(() {
                            purpose = value;
                            print(purpose);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Boarding',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'Training',
                      groupValue: purpose,
                      onChanged: (value) {
                        setState(() {
                          purpose = value;
                          print(purpose);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Training',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'From ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                        child: buildDatefield(
                            datearg: fromdate, hint: 'From date')),
                    Text(
                      '  To ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                        child:
                            buildDatefield(datearg: todate, hint: 'To date')),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                buildTextfield(
                  type: TextInputType.name,
                  value: petname,
                  line: 1,
                  lableText: 'Pet Name',
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextfield(
                  type: TextInputType.name,
                  value: petbreed,
                  line: 1,
                  lableText: 'Breed',
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextfield(
                  type: TextInputType.name,
                  value: petcolour,
                  line: 1,
                  lableText: 'Colour',
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildDatefield(datearg: petdob, hint: 'DOB'),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Male',
                        groupValue: petgender,
                        onChanged: (value) {
                          setState(() {
                            petgender = value;
                            print(petgender);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'Female',
                      groupValue: petgender,
                      onChanged: (value) {
                        setState(() {
                          petgender = value;
                          print(petgender);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Spayed',
                        groupValue: speynauter,
                        onChanged: (value) {
                          setState(() {
                            speynauter = value;
                            print(speynauter);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Spayed',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'Neutered',
                      groupValue: speynauter,
                      onChanged: (value) {
                        setState(() {
                          speynauter = value;
                          print(speynauter);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Neutered',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextfield(
                  type: TextInputType.number,
                  value: petweight,
                  line: 1,
                  lableText: 'Weight',
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Last Heat  ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Expanded(
                        child: buildDatefield(
                          datearg: lastheat,
                          hint: 'Last Heat',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Next Heat ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Expanded(
                        child: buildDatefield(
                          datearg: nextheat,
                          hint: 'Next Heat',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          '2. VETERINARY DETAILS',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      buildTextfield(
                        type: TextInputType.name,
                        value: vetname,
                        line: 1,
                        lableText: 'Name',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      buildTextfield(
                        type: TextInputType.number,
                        value: vetcontact,
                        line: 1,
                        lableText: 'Contact No',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      buildTextfield(
                        type: TextInputType.streetAddress,
                        value: vettime,
                        line: 1,
                        lableText: 'Clinic Timing',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      buildTextfield(
                        type: TextInputType.name,
                        value: vetweekoff,
                        line: 1,
                        lableText: 'Week Off',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '3. DOES MEDICATIONS ON A REGULAR BASIS',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ///////////////////
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                              value: 'Yes',
                              groupValue: ismedications,
                              onChanged: (value) {
                                setState(() {
                                  isVisible = true;
                                  ismedications = value;
                                  print(ismedications);
                                });
                              }),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Radio(
                            value: 'No',
                            groupValue: ismedications,
                            onChanged: (value) {
                              setState(() {
                                isVisible = false;
                                ismedications = value;
                                print(ismedications);
                              });
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'No',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),

                      Visibility(
                        visible: isVisible,
                        child: Table(
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: buildTextfield(
                                  type: TextInputType.name,
                                  value: medication1,
                                  line: 1,
                                  lableText: 'Medication',
                                ),
                              ),
                              buildTextfield(
                                type: TextInputType.name,
                                value: dosage1,
                                line: 1,
                                lableText: 'Dosage',
                              ),
                              buildTextfield(
                                type: TextInputType.name,
                                value: prescribe1,
                                line: 1,
                                lableText: 'Prescribed',
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: buildTextfield(
                                  type: TextInputType.name,
                                  value: medication2,
                                  line: 1,
                                  lableText: 'Medication',
                                ),
                              ),
                              buildTextfield(
                                type: TextInputType.name,
                                value: dosage2,
                                line: 1,
                                lableText: 'Dosage',
                              ),
                              buildTextfield(
                                type: TextInputType.name,
                                value: prescribe2,
                                line: 1,
                                lableText: 'Prescribed',
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: buildTextfield(
                                  type: TextInputType.name,
                                  value: medication3,
                                  line: 1,
                                  lableText: 'Medication',
                                ),
                              ),
                              buildTextfield(
                                type: TextInputType.name,
                                value: dosage3,
                                line: 1,
                                lableText: 'Dosage',
                              ),
                              buildTextfield(
                                type: TextInputType.name,
                                value: prescribe3,
                                line: 1,
                                lableText: 'Prescribed',
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          '4. VACCINATION DETAILS',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Table(
                        children: [
                          TableRow(children: [
                            Text(
                              'Rabies ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: buildDatefield(
                                  datearg: rslast, hint: 'Last Due'),
                            ),
                            buildDatefield(datearg: rsnext, hint: 'Next Due')
                          ]),
                          TableRow(children: [
                            Text(
                              '7 in 1 ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: buildDatefield(
                                  datearg: solast, hint: 'Last Due'),
                            ),
                            buildDatefield(datearg: sonext, hint: 'Next Due')
                          ]),
                          TableRow(children: [
                            Text(
                              'Bordetella ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: buildDatefield(
                                  datearg: balast, hint: 'Last Due'),
                            ),
                            buildDatefield(datearg: banext, hint: 'Next Due')
                          ]),
                          TableRow(children: [
                            Text(
                              'Deworming ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: buildDatefield(
                                  datearg: delast, hint: 'Last Due'),
                            ),
                            buildDatefield(datearg: denext, hint: 'Next Due')
                          ]),
                          TableRow(children: [
                            Text(
                              'De-Tick ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: buildDatefield(
                                  datearg: detlast, hint: 'Last Due'),
                            ),
                            buildDatefield(datearg: detnext, hint: 'Next Due')
                          ]),
                          TableRow(children: [
                            Text(
                              'Any other',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            buildDatefield(datearg: aolast, hint: 'Last Due'),
                            buildDatefield(datearg: aonext, hint: 'Next Due')
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Pet Information Form',
        subtitle: 'Please fill all the information about your pet',
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '5. IS YOUR PET PRONE TO',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Eye Infection",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Eye Infection',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Eye drainage",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Eye drainage',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Sensitive pad",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Sensitive pad',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Skin allergies",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Skin allergies',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Stress related diarrhea",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Stress related diarrhea',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("AnyOther", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'AnyOther',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Not Applicable",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Not Applicable',
                        groupValue: petProne,
                        onChanged: (value) {
                          setState(() {
                            petProne = value;
                            print(petProne);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '6. DOES YOU PET EVER TEND TO BE POSSESSIVE OF',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Food", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Food',
                        groupValue: petTend,
                        onChanged: (value) {
                          setState(() {
                            petTend = value;
                            print(petTend);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Treats", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Treats',
                        groupValue: petTend,
                        onChanged: (value) {
                          setState(() {
                            petTend = value;
                            print(petTend);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Toys", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Toys',
                        groupValue: petTend,
                        onChanged: (value) {
                          setState(() {
                            petTend = value;
                            print(petTend);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Bed", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Bed',
                        groupValue: petTend,
                        onChanged: (value) {
                          setState(() {
                            petTend = value;
                            print(petTend);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("AnyOther", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'AnyOther',
                        groupValue: petTend,
                        onChanged: (value) {
                          setState(() {
                            petTend = value;
                            print(petTend);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Not Applicable",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Not Applicable',
                        groupValue: petTend,
                        onChanged: (value) {
                          setState(() {
                            petTend = value;
                            print(petTend);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '7. HOW OFTEN YOUR PET GOES TO THE DOG PARK OR DAYCARE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title:
                          Text("Every day", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Every day',
                        groupValue: parkDaycare,
                        onChanged: (value) {
                          setState(() {
                            parkDaycare = value;
                            print(parkDaycare);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title:
                          Text("Every week", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Every week',
                        groupValue: parkDaycare,
                        onChanged: (value) {
                          setState(() {
                            parkDaycare = value;
                            print(parkDaycare);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title:
                          Text("Every month", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Every month',
                        groupValue: parkDaycare,
                        onChanged: (value) {
                          setState(() {
                            parkDaycare = value;
                            print(parkDaycare);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Has never been",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Has never been',
                        groupValue: parkDaycare,
                        onChanged: (value) {
                          setState(() {
                            parkDaycare = value;
                            print(parkDaycare);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Not Applicable",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Not Applicable',
                        groupValue: parkDaycare,
                        onChanged: (value) {
                          setState(() {
                            parkDaycare = value;
                            print(parkDaycare);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '8. HOW OFTEN YOUR PET AROUND OTHER DOGS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title:
                          Text("Every day", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Every day',
                        groupValue: petAround,
                        onChanged: (value) {
                          setState(() {
                            petAround = value;
                            print(petAround);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title:
                          Text("Once a week", style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Once a week',
                        groupValue: petAround,
                        onChanged: (value) {
                          setState(() {
                            petAround = value;
                            print(petAround);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Once a month",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Once a month',
                        groupValue: petAround,
                        onChanged: (value) {
                          setState(() {
                            petAround = value;
                            print(petAround);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Once or twice till now",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Once or twice till now',
                        groupValue: petAround,
                        onChanged: (value) {
                          setState(() {
                            petAround = value;
                            print(petAround);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Has never been",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Has never been',
                        groupValue: petAround,
                        onChanged: (value) {
                          setState(() {
                            petAround = value;
                            print(petAround);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Not Applicable",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Not Applicable',
                        groupValue: petAround,
                        onChanged: (value) {
                          setState(() {
                            petAround = value;
                            print(petAround);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '9. Which option below describes your pet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Sometime play with other dogs",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Sometime play with other dogs',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Usually ignores other dogs",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Usually ignores other dogs',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Can be aggressive at times",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Can be aggressive at times',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Never been around with other dogs",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Never been around with other dogs',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Love to play with other dogs",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Love to play with other dogs',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Does not like at all",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Does not like at all',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("I don\'t know",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'I don\'t know',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Not Applicable",
                          style: TextStyle(fontSize: 18.0)),
                      leading: Radio(
                        value: 'Not Applicable',
                        groupValue: petDescribe,
                        onChanged: (value) {
                          setState(() {
                            petDescribe = value;
                            print(petDescribe);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '10. HOW MANY HOURS YOUR PET GETS EXERCISE IN A DAY',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: buildTextfield(
                    type: TextInputType.number,
                    value: petexcercise,
                    line: 1,
                    lableText: '',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Pet Information Form',
        subtitle: 'Please fill all the information about your pet',
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '11. IS YOUR PET.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Allergic to any medicines?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet1,
                        onChanged: (value) {
                          setState(() {
                            isyourpet1 = true;
                            ispet1 = value;
                            print(ispet1);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet1,
                      onChanged: (value) {
                        setState(() {
                          isyourpet1 = false;
                          ispet1 = value;
                          print(ispet1);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet1,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet1rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Allergic to foods?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet2,
                        onChanged: (value) {
                          setState(() {
                            isyourpet2 = true;
                            ispet2 = value;
                            print(ispet2);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet2,
                      onChanged: (value) {
                        setState(() {
                          isyourpet2 = false;
                          ispet2 = value;
                          print(ispet2);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet2,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet2rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Allergic to any grass/ mud etc?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet3,
                        onChanged: (value) {
                          setState(() {
                            isyourpet3 = true;
                            ispet3 = value;
                            print(ispet3);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet3,
                      onChanged: (value) {
                        setState(() {
                          isyourpet3 = false;
                          ispet3 = value;
                          print(ispet3);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet3,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet3rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* On any medication within last 6 month?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet4,
                        onChanged: (value) {
                          setState(() {
                            isyourpet4 = true;
                            ispet4 = value;
                            print(ispet4);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet4,
                      onChanged: (value) {
                        setState(() {
                          isyourpet4 = false;
                          ispet4 = value;
                          print(ispet4);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet4,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet4rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Any major illness history',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet5,
                        onChanged: (value) {
                          setState(() {
                            isyourpet5 = true;
                            ispet5 = value;
                            print(ispet5);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet5,
                      onChanged: (value) {
                        setState(() {
                          isyourpet5 = false;
                          ispet5 = value;
                          print(ispet5);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet5,
                  child: buildTextfield(
                    type: TextInputType.text,
                    value: illness,
                    line: 1,
                    lableText: 'If Yes, Specify',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Excessively fearful of thunderstorms?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet6,
                        onChanged: (value) {
                          setState(() {
                            isyourpet6 = true;
                            ispet6 = value;
                            print(ispet6);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet6,
                      onChanged: (value) {
                        setState(() {
                          isyourpet6 = false;
                          ispet6 = value;
                          print(ispet6);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet6,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet5rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Have any specific fear or dislike?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet7,
                        onChanged: (value) {
                          setState(() {
                            isyourpet7 = true;
                            ispet7 = value;
                            print(ispet7);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet7,
                      onChanged: (value) {
                        setState(() {
                          isyourpet7 = false;
                          ispet7 = value;
                          print(ispet7);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet7,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet6rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Bitten any other dog?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet8,
                        onChanged: (value) {
                          setState(() {
                            isyourpet8 = true;
                            ispet8 = value;
                            print(ispet8);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet8,
                      onChanged: (value) {
                        setState(() {
                          isyourpet8 = false;
                          ispet8 = value;
                          print(ispet8);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet8,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet7rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '* Bitten any human being?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'Yes',
                        groupValue: ispet9,
                        onChanged: (value) {
                          setState(() {
                            isyourpet9 = true;
                            ispet9 = value;
                            print(ispet9);
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'No',
                      groupValue: ispet9,
                      onChanged: (value) {
                        setState(() {
                          ispet9 = value;
                          isyourpet9 = false;
                          print(ispet9);
                        });
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: isyourpet9,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextfield(
                          type: TextInputType.text,
                          value: ispet8rea,
                          line: 1,
                          lableText: 'If Yes, Specify',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          '12. MEAL SCHEDULE.',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Table(
                        children: [
                          TableRow(children: [
                            /*  Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Meals',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Time',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Diet',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            /*  Text(
                              'Morning',
                              style: TextStyle(fontSize: 18.0),
                            ),*/
                            TextFormField(
                              onTap: morning,
                              controller: mrng,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Morning',
                              ),
                            ),
                            buildTextfield(
                              type: TextInputType.name,
                              value: mrngdiet,
                              line: 1,
                              lableText: 'Diet',
                            ),
                            buildTextfield(
                              type: TextInputType.number,
                              value: mrngquant,
                              line: 1,
                              lableText: 'Quantity',
                            ),
                          ]),
                          TableRow(children: [
                            /*   Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 5.0),
                              child: Text(
                                'Afternoon',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),*/
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: TextFormField(
                                onTap: afternoon,
                                controller: after,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Afternoon ',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: buildTextfield(
                                type: TextInputType.name,
                                value: afrndiet,
                                line: 1,
                                lableText: 'Diet',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: buildTextfield(
                                type: TextInputType.number,
                                value: afrnquant,
                                line: 1,
                                lableText: 'Quantity',
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            /*Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Evening',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),*/
                            TextFormField(
                              onTap: evening,
                              controller: eve,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Evening',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: buildTextfield(
                                type: TextInputType.name,
                                value: evediet,
                                line: 1,
                                lableText: 'Diet',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: buildTextfield(
                                type: TextInputType.number,
                                value: evequant,
                                line: 1,
                                lableText: 'Quantity',
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            /*   Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Night',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),*/
                            TextFormField(
                              onTap: night,
                              controller: nyt,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Night',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: buildTextfield(
                                type: TextInputType.name,
                                value: nightdiet,
                                line: 1,
                                lableText: 'Diet',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: buildTextfield(
                                type: TextInputType.number,
                                value: nightquant,
                                line: 1,
                                lableText: 'Quantity',
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '* I HAVE DULY FILLED IN ALL THE DETAILS TO MY '
                        'BEST KNOWLEDGE.',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Place', style: TextStyle(fontSize: 18.0)),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: buildTextfield(
                                  type: TextInputType.text,
                                  value: place,
                                  line: 1,
                                  lableText: 'Place',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Text('Date  ', style: TextStyle(fontSize: 18.0)),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              5.0) //                 <--- border radius here
                                          ),
                                      border:
                                          Border.all(color: Colors.black38)),
                                  child: Text(todaydate),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        showAlertDialog(context);
      },
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet boarding',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Container(
        child: stepper,
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required FormFieldValidator<String> validator,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  Widget _buildSelector({
    required BuildContext context,
    required String name,
  }) {
    final isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String? v) {
            setState(() {
              selectedRole = v!;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
