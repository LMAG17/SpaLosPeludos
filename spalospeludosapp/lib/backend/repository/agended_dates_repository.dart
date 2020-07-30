import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spalospeludosapp/backend/models/agended_date_model.dart';
import 'package:spalospeludosapp/backend/models/completed_dates_model.dart';

class AgendedDatesRepository {
  Future<void> addNewAgendedDates(AgendedDate agendedDates) async {
    print("Action addNewAgendedDates");
  }

  Future<void> completeDate(
      AgendedDate agendedDate, String comments, String total) async {
    final dbCompleteReference = Firestore.instance.collection("CompletedDates");
    final dbAgendReference = Firestore.instance.collection("AgendedDates");
    print(comments + " -- " + total);
    var completedDate = CompletedDate(
        id: agendedDate.id,
        data: DataCompletedDate(
          name: agendedDate.data.name,
          phone: agendedDate.data.phone,
          address: agendedDate.data.address,
          email: agendedDate.data.email,
          pet: agendedDate.data.pet,
          breed: agendedDate.data.breed,
          observations: agendedDate.data.observations,
          date: agendedDate.data.date,
          comments: comments,
          total: total.toString(),
        ));
    await dbCompleteReference
        .add(completedDate.data.toDocument())
        .then((value) {
      dbAgendReference.document(agendedDate.id).delete();
    });
    print("Action addNewUserForm");
  }

  Future<void> deleteAgendedDates(AgendedDate agendedDates) async {
    print("Action deleteAgendedDates");
  }

  Stream<List<AgendedDate>> agendedDates() {
    print("trata de pegarle al firebase");
    return Firestore.instance
        .collection("AgendedDates")
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map(
            (doc) => AgendedDate(
              id: doc.documentID,
              data: DataAgendedDate.fromMap(
                doc.data,
              ),
            ),
          )
          .toList();
    });
  }

  Future<void> updateAgendedDates(AgendedDate agendedDates) async {
    print("Action updateAgendedDates");
  }
}
