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
      name: userForm.name,
      phone: userForm.phone,
      address: userForm.address,
      email: userForm.email,
      pet: userForm.pet,
      breed: userForm.breed,
      observations: observations,
      date: agendedDateTime.toString(),
    );
    await dbAgendReference.add(agendedDate.toDocument()).then((value) {
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
          .map((doc) => UserForm(
              id: doc.documentID,
              name: doc.data["name"],
              phone: doc.data["phone"],
              email: doc.data["email"],
              address: doc.data["address"],
              pet: doc.data["pet"],
              breed: doc.data["breed"]))
          .toList();
    });
  }

  Future<void> updateUserForm(UserForm userForm) async {
    print("Action updateUserForm");
  }
}
