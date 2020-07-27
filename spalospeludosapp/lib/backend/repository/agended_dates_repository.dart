import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spalospeludosapp/backend/models/agended_date_model.dart';

class AgendedDatesRepository {
  Future<void> addNewAgendedDates(AgendedDate agendedDates) async {
    print("Action addNewAgendedDates");
  }

  Future<void> deleteAgendedDates(AgendedDate agendedDates) async {
    print("Action deleteAgendedDates");
  }

  Stream<List<AgendedDate>> agendedDates() {
    print("trata de pegarle al firebase");
    return Firestore.instance.collection("AgendedDates").snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => AgendedDate.fromMap(doc.data))
          .toList();
    });
  }

  Future<void> updateAgendedDates(AgendedDate agendedDates) async {
    print("Action updateAgendedDates");
  }
}
