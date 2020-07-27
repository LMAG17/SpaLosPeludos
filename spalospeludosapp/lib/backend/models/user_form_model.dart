import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserForm {
  UserForm({
    this.id,
    this.address,
    this.phone,
    this.name,
    this.breed,
    this.email,
    this.pet,
  });

  final String id;
  final String address;
  final int phone;
  final String name;
  final String breed;
  final String email;
  final String pet;

  UserForm copyWith({
  final String id,
    String address,
    int phone,
    String name,
    String breed,
    String email,
    String pet,
  }) =>
      UserForm(
        id: id ?? this.id,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        breed: breed ?? this.breed,
        email: email ?? this.email,
        pet: pet ?? this.pet,
      );

  factory UserForm.fromJson(String str) => UserForm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserForm.fromMap(Map<String, dynamic> json) => UserForm(
        id: json["id"],
        address: json["address"],
        phone: json["phone"],
        name: json["name"],
        breed: json["breed"],
        email: json["email"],
        pet: json["pet"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "address": address,
        "phone": phone,
        "name": name,
        "breed": breed,
        "email": email,
        "pet": pet,
      };

  static UserForm fromSnapshot(DocumentSnapshot snap) {
    return UserForm(
      id: snap.data['id'],
      address: snap.data['address'],
      phone: snap.data['phone'],
      name: snap.data['name'],
      breed: snap.data['breed'],
      email: snap.data['email'],
      pet: snap.data['pet'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "id": id,
      "address": address,
      "phone": phone,
      "name": name,
      "breed": breed,
      "email": email,
      "pet": pet,
    };
  }
  
}
