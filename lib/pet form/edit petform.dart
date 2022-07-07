import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pet page/pet page.dart';
import '../reusable widget/reusable.dart';

class EditFormPage extends StatefulWidget {
  // final PetInformation value;

  String userid;
  String userpetid;

  EditFormPage({required this.userid, required this.userpetid});
  @override
  _EditFormPageState createState() => _EditFormPageState(userid, userpetid);
}

class _EditFormPageState extends State<EditFormPage> {
  String userid;
  String userpetid;

  _EditFormPageState(this.userid, this.userpetid);
  String selectedRole = 'Writer';

  FirebaseAuth auth = FirebaseAuth.instance;
// fields

  Object? petgender = '';
  Object? ismedications = '';
  Object? speynauter = '';
  //

  Object? ispet1 = '';
  Object? ispet2 = '';
  Object? ispet3 = '';
  Object? ispet4 = '';
  Object? ispet5 = '';
  Object? ispet6 = '';
  Object? ispet7 = '';
  Object? ispet8 = '';
  Object? ispet9 = '';
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

  @override
  void initState() {
    getPetDetails();
    // TODO: implement initState
    super.initState();
  }

  String getpurpose = '';
  String getfromdate = '';
  String gettodate = '';
  String getpetname = '';
  String getpetbreed = '';
  String getpetcolor = '';
  String getpetdob = '';
  String getpetgender = '';
  String getismedication = '';
  String getspayneuter = '';
  String getpetweight = '';
  String getlastheat = '';
  String getnextheat = '';
  String getvetname = '';
  String getvetmobile = '';
  String getvettime = '';
  String getvetweekoff = '';
  String getrslast = '';
  String getrsnext = '';
  String getsolast = '';
  String getsonext = '';
  String getbalast = '';
  String getbanext = '';
  String getdelast = '';
  String getdenext = '';
  String getdetlast = '';
  String getdetnext = '';
  String getaolast = '';
  String getaonext = '';
  String getmedication1 = '';
  String getdosage1 = '';
  String getprescribe1 = '';
  String getmedication2 = '';
  String getdosage2 = '';
  String getprescribe2 = '';
  String getmedication3 = '';
  String getdosage3 = '';
  String getprescribe3 = '';
  String getpetProne = '';
  String getpetTend = '';
  String getparkDaycare = '';
  String getpetAround = '';
  String getpetDescribe = '';
  String getpetexcercise = '';
  String getispet1rea = '';
  String getispet2rea = '';
  String getispet3rea = '';
  String getispet4rea = '';
  String getispet5rea = '';
  String getispet6rea = '';
  String getispet7rea = '';
  String getispet8rea = '';
  String getispet1 = '';
  String getispet2 = '';
  String getispet3 = '';
  String getispet4 = '';
  String getispet5 = '';
  String getispet6 = '';
  String getispet7 = '';
  String getispet8 = '';
  String getispet9 = '';

  String getillness = '';
  String getmorningTime = '';
  String getafternoonTime = '';
  String getEveningTime = '';
  String getnightTime = '';
  String getmrngdiet = '';
  String getmrngquant = '';
  String getafrndiet = '';
  String getafrnquant = '';
  String getevediet = '';
  String getevequant = '';
  String getnightdiet = '';
  String getnightquant = '';
  String getplace = '';
  String getfilleddate = '';

  // String? uidd;
  void getPetDetails() {
    FirebaseFirestore.instance
        .collection('Pet Details')
        .doc(userid)
        .collection('pet')
        .doc(userpetid)
        .get()
        .then((value) {
      print(value.data());
      setState(() {
        getpurpose = value.data()!["purpose"];
        getfromdate = value.data()!['fromdate'];
        gettodate = value.data()!['todate'];
        getpetname = value.data()!['petname'];
        getpetbreed = value.data()!["petbreed"];
        getpetcolor = value.data()!["petcolor"];
        getpetdob = value.data()!["petdob"];
        getpetgender = value.data()!["petgender"];
        getismedication = value.data()!["ismedication"];
        getspayneuter = value.data()!["spayneuter"];
        getpetweight = value.data()!["petweight"];
        getlastheat = value.data()!["lastheat"];
        getnextheat = value.data()!["nextheat"];
        getvetname = value.data()!["vetname"];
        getvetmobile = value.data()!["vetmobile"];
        getvettime = value.data()!["vettime"];
        getvetweekoff = value.data()!["vetweekoff"];
        getrslast = value.data()!["rslast"];
        getrsnext = value.data()!["rsnext"];
        getsolast = value.data()!["solast"];
        getsonext = value.data()!["sonext"];
        getbalast = value.data()!["balast"];
        getbanext = value.data()!["banext"];
        getdelast = value.data()!["delast"];
        getdenext = value.data()!["denext"];
        getdetlast = value.data()!["detlast"];
        getdetnext = value.data()!["detnext"];
        getaolast = value.data()!["aolast"];
        getaonext = value.data()!["aonext"];
        getmedication1 = value.data()!["medication1"];
        getdosage1 = value.data()!["dosage1"];
        getprescribe1 = value.data()!["prescribe1"];
        getmedication2 = value.data()!["medication2"];
        getdosage2 = value.data()!["dosage2"];
        getprescribe2 = value.data()!["prescribe2"];
        getmedication3 = value.data()!["medication3"];
        getdosage3 = value.data()!["dosage3"];
        getprescribe3 = value.data()!["prescribe3"];
        getpetProne = value.data()!["petProne"];
        getpetTend = value.data()!["petTend"];
        getparkDaycare = value.data()!["parkDaycare"];
        getpetAround = value.data()!["petAround"];
        getpetDescribe = value.data()!["petDescribe"];
        getpetexcercise = value.data()!["petexcercise"];
        getispet1rea = value.data()!["ispet1rea"];
        getispet2rea = value.data()!["ispet2rea"];
        getispet3rea = value.data()!["ispet3rea"];
        getispet4rea = value.data()!["ispet4rea"];
        getispet5rea = value.data()!["ispet5rea"];
        getispet6rea = value.data()!["ispet6rea"];
        getispet7rea = value.data()!["ispet7rea"];
        getispet8rea = value.data()!["ispet8rea"];
        getispet1 = value.data()!['ispet1'];
        getispet2 = value.data()!['ispet2'];
        getispet3 = value.data()!['ispet3'];
        getispet4 = value.data()!['ispet4'];
        getispet5 = value.data()!['ispet5'];
        getispet6 = value.data()!['ispet6'];
        getispet7 = value.data()!['ispet7'];
        getispet8 = value.data()!['ispet8'];
        getispet9 = value.data()!['ispet9'];
        getillness = value.data()!["illness"];
        getmorningTime = value.data()!["morningTime"];
        getafternoonTime = value.data()!["afternoonTime"];
        getEveningTime = value.data()!["EveningTime"];
        getnightTime = value.data()!["nightTime"];
        getmrngdiet = value.data()!["mrngdiet"];
        getmrngquant = value.data()!["mrngquant"];
        getafrndiet = value.data()!["afrndiet"];
        getafrnquant = value.data()!["afrnquant"];
        getevediet = value.data()!["evediet"];
        getevequant = value.data()!["evequant"];
        getnightdiet = value.data()!["nightdiet"];
        getnightquant = value.data()!["nightquant"];
        getplace = value.data()!["place"];
        getfilleddate = value.data()!["filleddate"];
      });
    });
  }

  Object? purpose;

  @override
  Widget build(BuildContext context) {
    purpose = getpurpose;
    fromdate.text = getfromdate;
    todate.text = gettodate;
    petname.text = getpetname;
    petbreed.text = getpetbreed;
    petcolour.text = getpetcolor;
    petdob.text = getpetdob;
    petgender = getpetgender;
    ismedications = getismedication;
    speynauter = getspayneuter;
    lastheat.text = getlastheat;
    nextheat.text = getnextheat;
    petweight.text = getpetweight;
    vetname.text = getvetname;
    vetcontact.text = getvetmobile;
    vettime.text = getvettime;
    vetweekoff.text = getvetweekoff;
    rslast.text = getrslast;
    rsnext.text = getrsnext;
    solast.text = getsolast;
    sonext.text = getsonext;
    balast.text = getbalast;
    banext.text = getbanext;
    delast.text = getdelast;
    denext.text = getdenext;
    detlast.text = getdetlast;
    detnext.text = getdetnext;
    aolast.text = getaolast;
    aonext.text = getaonext;
    medication1.text = getmedication1;
    dosage1.text = getdosage1;
    prescribe1.text = getprescribe1;
    medication2.text = getmedication2;
    dosage2.text = getdosage2;
    prescribe2.text = getprescribe2;
    medication3.text = getmedication3;
    dosage3.text = getdosage3;
    prescribe3.text = getprescribe3;
    petProne = getpetProne;
    petTend = getpetTend;
    parkDaycare = getparkDaycare;
    petAround = getpetAround;
    petDescribe = getpetDescribe;
    petexcercise.text = getpetexcercise;
    ispet1rea.text = getispet1rea;
    ispet2rea.text = getispet2rea;
    ispet3rea.text = getispet3rea;
    ispet4rea.text = getispet4rea;
    ispet5rea.text = getispet5rea;
    ispet6rea.text = getispet6rea;
    ispet7rea.text = getispet7rea;
    ispet8rea.text = getispet8rea;
    ispet1 = getispet1;
    ispet2 = getispet2;
    ispet3 = getispet3;
    ispet4 = getispet4;
    ispet5 = getispet5;
    ispet6 = getispet6;
    ispet7 = getispet7;
    ispet8 = getispet8;
    ispet9 = getispet9;

    illness.text = getillness;
    mrng.text = getmorningTime;
    after.text = getafternoonTime;
    eve.text = getEveningTime;
    nyt.text = getnightTime;
    mrngdiet.text = getmrngdiet;
    mrngquant.text = getmrngquant;
    afrndiet.text = getafrndiet;
    afrnquant.text = getafrnquant;
    evediet.text = getevediet;
    evequant.text = getevequant;
    nightdiet.text = getnightdiet;
    nightquant.text = getnightquant;
    place.text = getplace;
    filleddate.text = getfilleddate;

    updatePet() {
      FirebaseFirestore.instance
          .collection('Pet Details')
          .doc(userid)
          .collection('pet')
          .doc(userpetid)
          .update(
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
          'filleddate': filleddate.text,
        },
      );
    }

    bool visibility = ismedications == 'No' ? false : true;

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
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                  height: 5.0,
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
                              datearg: lastheat, hint: 'Last Heat')),
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
                              datearg: nextheat, hint: 'Next Heat')),
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
                            fontSize: 20,
                          ),
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
                        type: TextInputType.name,
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
                          fontSize: 20,
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
                              groupValue: ismedications,
                              onChanged: (value) {
                                setState(() {
                                  ismedications = value;
                                  print(getismedication);
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
                        visible: visibility,
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
                                lableText: 'Prescribed For',
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
                                lableText: 'Prescribed For',
                              ),
                            ]),
                            TableRow(children: [
                              buildTextfield(
                                type: TextInputType.name,
                                value: medication3,
                                line: 1,
                                lableText: 'Medication',
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
                                lableText: 'Prescribed For',
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
                            fontSize: 20,
                          ),
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
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                  style: TextStyle(
                    fontSize: 20,
                  ),
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
                  style: TextStyle(
                    fontSize: 20,
                  ),
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
                  style: TextStyle(
                    fontSize: 20,
                  ),
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
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                  style: TextStyle(
                    fontSize: 18,
                  ),
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
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                  visible: ispet1 == 'Yes' ? true : false,
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
                  visible: ispet2 == 'Yes' ? true : false,
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
                  visible: ispet3 == 'Yes' ? true : false,
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
                  visible: ispet4 == 'Yes' ? true : false,
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
                            ispet5 = value;

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
                      groupValue: ispet5,
                      onChanged: (value) {
                        setState(() {
                          ispet5 = value;

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
                  visible: ispet5 == 'Yes' ? true : false,
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
                            ispet6 = value;

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
                      groupValue: ispet6,
                      onChanged: (value) {
                        setState(() {
                          ispet6 = value;
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
                  visible: ispet6 == 'Yes' ? true : false,
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
                            ispet7 = value;
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
                          ispet7 = value;

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
                  visible: ispet7 == 'Yes' ? true : false,
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
                            ispet8 = value;

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
                      groupValue: ispet8,
                      onChanged: (value) {
                        setState(() {
                          ispet8 = value;

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
                  visible: ispet8 == 'Yes' ? true : false,
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
                            ispet9 = value;

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
                      groupValue: ispet9,
                      onChanged: (value) {
                        setState(() {
                          ispet9 = value;

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
                  visible: ispet9 == 'Yes' ? true : false,
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
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Table(
                        children: [
                          TableRow(children: [
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
                              type: TextInputType.name,
                              value: mrngquant,
                              line: 1,
                              lableText: 'Quantity',
                            ),
                          ]),
                          TableRow(children: [
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
                                type: TextInputType.name,
                                value: afrnquant,
                                line: 1,
                                lableText: 'Quantity',
                              ),
                            ),
                          ]),
                          TableRow(children: [
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
                                type: TextInputType.name,
                                value: evequant,
                                line: 1,
                                lableText: 'Quantity',
                              ),
                            ),
                          ]),
                          TableRow(children: [
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
                                type: TextInputType.name,
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
                        style: TextStyle(fontSize: 18.0),
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
                                          Radius.circular(5.0) //
                                          ),
                                      border:
                                          Border.all(color: Colors.black38)),
                                  child: Text(filleddate.text),
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
    void showAlertDialog(BuildContext context) {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("No"),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => PetPage(
                        clientid: userid,
                      )),
              ModalRoute.withName('/profile'));
        },
      );
      Widget continueButton = TextButton(
        child: Text("Yes"),
        onPressed: () {
          updatePet();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => PetPage(
                        clientid: userid,
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
        content: Text("Do you want to save the changes"),
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

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        // updatePet();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => PetPage(
                      clientid: userid,
                    )),
            ModalRoute.withName('/profile'));

/*        // demoFirestore(place.text, filleddate.text);
        print('Steps completed!');
        Navigator.pop(context);*/
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
