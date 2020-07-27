import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreServiceFactory {
  Future<Firestore> getApp() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'db',
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: '1:267997855255:ios:396350f18505699a2a6652',
              gcmSenderID: '267997855255',
              databaseURL: 'https://spalospeludos.firebaseio.com',
            )
          : const FirebaseOptions(
              googleAppID: '1:267997855255:android:9200182ab6457b8a2a6652',
              apiKey: 'AIzaSyAc6VSCig3J1VwiCz8MrzQ7hx-j9iNqT8A',
              databaseURL: 'https://spalospeludos.firebaseio.com',
            ),
    );
    final Firestore firestoreApp = Firestore(app:app);
  
    return firestoreApp;
  }
}
