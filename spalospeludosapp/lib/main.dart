import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spalospeludosapp/backend/sevices/factory.dart';
import 'package:spalospeludosapp/frontEnd/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      app: await FirestoreServiceFactory().getApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    this.app,
    Key key,
  }) : super(key: key);
  final Firestore app;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff3a3cad),
        primaryColorLight: Color(0xff7167e0),
        primaryColorDark: Color(0xff00157d)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
