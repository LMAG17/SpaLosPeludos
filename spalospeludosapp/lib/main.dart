import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spalospeludosapp/backend/sevices/factory.dart';
import 'package:spalospeludosapp/frontEnd/ui/home_screen.dart';

import 'backend/provders/push_notification_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      app: await FirestoreServiceFactory().getApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({this.app,Key key}) : super(key: key);
  final Firestore app;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    final _pushProvider = PushNotificationProvider();
    _pushProvider.initNotifications();
    _pushProvider.mensajes.listen((argumento) {
      navigatorKey.currentState.pushNamed('mensaje', arguments: argumento);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff3a3cad),
          primaryColorLight: Color(0xff7167e0),
          primaryColorDark: Color(0xff00157d)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}