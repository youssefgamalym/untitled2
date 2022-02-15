import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/routine.dart';
import 'package:untitled2/singup.dart';
import 'Settings.dart';
import 'control.dart';
import 'screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const String screen = "screen";
  static const String signUp = 'signUp';
  static const String routine = 'routine';
  static const String control = 'control';
  // static const String sandsms = 'sandsms';
  static const String settings = 'settings';
  static const String home = 'home';

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waiting',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: home(),
      routes: {
        "screen": ((context) => screen()),
        "signUp": ((context) => signUp()),
        "routine": ((context) => routine()),
        "control": ((context) => control()),
        "settings": ((context) => Settings()),
        "home": ((context) => home()),
      },
    );
  }
}
