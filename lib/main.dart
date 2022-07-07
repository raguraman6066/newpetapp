import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'client page/client page.dart';
import 'login page/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.armataTextTheme(),
          backgroundColor: Colors.deepPurple,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: false,
          elevation: 15,
          titleTextStyle: TextStyle(color: Colors.lightBlueAccent),
        ),
      ).copyWith(
        textTheme: GoogleFonts.armataTextTheme(),
      ),
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/profile',
      routes: {
        '/login': (context) => LoginPage(),
        '/profile': (context) => ClientPage(),
      },
    );
  }
}
