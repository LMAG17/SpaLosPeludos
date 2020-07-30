import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserForm {
  UserForm({this.id, this.data});

  final String id;
  final DataUserForm data;

  UserForm copyWith({
    String id,
    String data,
  }) =>
      UserForm(
        id: id ?? this.id,
        data: data ?? this.data,
      );

  factory UserForm.fromJson(String str) => UserForm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserForm.fromMap(Map<String, dynamic> json) => UserForm(
        id: json["id"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data,
      };

  static UserForm fromSnapshot(DocumentSnapshot snap) {
    return UserForm(
      id: snap.data['id'],
      data: snap.data['data'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "id": id,
      "data": data,
    };
  }
}

class DataUserForm {
  DataUserForm({
    this.address,
    this.phone,
    this.name,
    this.breed,
    this.email,
    this.pet,
  });

  final String address;
  final int phone;
  final String name;
  final String breed;
  final String email;
  final String pet;

  DataUserForm copyWith({
    final String address,
    int phone,
    String name,
    String breed,
    String email,
    String pet,
  }) =>
      DataUserForm(
        address: address ?? this.address,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        breed: breed ?? this.breed,
        email: email ?? this.email,
        pet: pet ?? this.pet,
      );

  factory DataUserForm.fromJson(String str) =>
      DataUserForm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataUserForm.fromMap(Map<String, dynamic> json) => DataUserForm(
        address: json["address"],
        phone: json["phone"],
        name: json["name"],
        breed: json["breed"],
        email: json["email"],
        pet: json["pet"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "phone": phone,
        "name": name,
        "breed": breed,
        "email": email,
        "pet": pet,
      };

  static DataUserForm fromSnapshot(DocumentSnapshot snap) {
    return DataUserForm(
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
      "address": address,
      "phone": phone,
      "name": name,
      "breed": breed,
      "email": email,
      "pet": pet,
    };
  }
}
