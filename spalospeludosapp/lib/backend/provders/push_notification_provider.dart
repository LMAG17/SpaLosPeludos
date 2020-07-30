import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;
  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print(
          'Aqui vamos a imprimir el token, tener en cuenta que un usuario puede tener varios tokens');
      print(token);
      //Token celular de luis
      //dQZXMRbrQcA:APA91bEweup0IsK3IPJ6LPeSeeJ943kRGnAIlV2ixzku2V3elsLJLj5JNQTbute1EG5Zcv_5PwHapxE0504IwI8K5zwNSJn-DHXG6E-v9Yn75t_MGKqESAWbATEmSlQdheP12uI4nKcH
    });
    // Future<dynamic> myBackgroundMessageHandler(
    //     Map<String, dynamic> message) async {
    //   if (message.containsKey('data')) {
    //     // Handle data message
    //     final dynamic data = message['data'];
    //   }

    //   if (message.containsKey('notification')) {
    //     // Handle notification message
    //     final dynamic notification = message['notification'];
    //   }

    //   // Or do other work.
    // }
    _firebaseMessaging.configure(
        //onBackgroundMessage: myBackgroundMessageHandler,
        onMessage: (info) async {
      print('===================onMessage=========================');
      print(info);
      if (Platform.isAndroid) {
        String arg = 'no-data';
        arg = info['data']['comida'] ?? 'no-data';
        _mensajesStreamController.sink.add(arg);
      }
    }, onLaunch: (info) async {
      print('===================onLaunch=========================');
      print(info);
    }, onResume: (info) async {
      print('===================onResume=========================');
      print(info);
      final arg = info['data']['comida'];
      _mensajesStreamController.sink.add(arg);
    });
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
