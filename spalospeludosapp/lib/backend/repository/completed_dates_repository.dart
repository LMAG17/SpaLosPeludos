import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spalospeludosapp/backend/models/completed_dates_model.dart';

class CompletedDatesRepository {
  Future<void> addNewCompletedDates(CompletedDate completedDates) async {
    print("Action addNewCompletedDates");
  }

  Future<void> deleteCompletedDates(CompletedDate completedDates) async {
    print("Action deleteCompletedDates");
  }

  Stream<List<CompletedDate>> completeDates() {
    print("trata de pegarle al firebase");
    return Firestore.instance
        .collection("CompletedDates")
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map(
            (doc) => CompletedDate(
              id: doc.documentID,
              data: DataCompletedDate.fromMap(
                doc.data,
              ),
            ),
          )
          .toList();
    });
  }

  Future<void> updateCompletedDates(CompletedDate completedDates) async {
    print("Action updateCompletedDates");
  }
}
