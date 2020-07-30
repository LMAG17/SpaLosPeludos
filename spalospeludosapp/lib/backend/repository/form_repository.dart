import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spalospeludosapp/backend/models/agended_date_model.dart';
import 'package:spalospeludosapp/backend/models/user_form_model.dart';

class UserFormRepository {
  final dbReference = Firestore.instance.collection("ClientForm");
  final dbAgendReference = Firestore.instance.collection("AgendedDates");
  Future<void> addNewAgend(
      UserForm userForm, DateTime agendedDateTime, String observations) async {
    var agendedDate = AgendedDate(
        id: userForm.id,
        data: DataAgendedDate(
          name: userForm.data.name,
          phone: userForm.data.phone,
          address: userForm.data.address,
          email: userForm.data.email,
          pet: userForm.data.pet,
          breed: userForm.data.breed,
          observations: observations,
          date: agendedDateTime.toString(),
        ));
    await dbAgendReference.add(agendedDate.data.toDocument()).then((value) {
      dbReference.document(userForm.id).delete();
    });
    print("Action addNewUserForm");
  }

  Future<void> deleteUserForm(UserForm userForm) async {
    print("Action deleteUserForm");
  }

  Stream<List<UserForm>> userForm() {
    print("trata de pegarle al firebase");
    return dbReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map(
            (doc) => UserForm(
              id: doc.documentID,
              data: DataUserForm.fromMap(
                doc.data,
              ),
            ),
          )
          .toList();
    });
  }

  Future<void> updateUserForm(UserForm userForm) async {
    print("Action updateUserForm");
  }
}
