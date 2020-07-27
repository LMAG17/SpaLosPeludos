import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AgendedDate {
  AgendedDate({
    this.address,
    this.phone,
    this.name,
    this.breed,
    this.email,
    this.pet,
    this.observations,
    this.date,
  });

  final String address;
  final int phone;
  final String name;
  final String breed;
  final String email;
  final String pet;
  final String observations;
  final String date;

  AgendedDate copyWith({
    String address,
    int phone,
    String name,
    String breed,
    String email,
    String pet,
    String observations,
    String date,
  }) =>
      AgendedDate(
        address: address ?? this.address,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        breed: breed ?? this.breed,
        email: email ?? this.email,
        pet: pet ?? this.pet,
        observations: observations ?? this.observations,
        date: date ?? this.date,
      );

  factory AgendedDate.fromJson(String str) =>
      AgendedDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AgendedDate.fromMap(Map<String, dynamic> json) => AgendedDate(
        address: json["address"],
        phone: json["phone"],
        name: json["name"],
        breed: json["breed"],
        email: json["email"],
        pet: json["pet"],
        observations: json["observations"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "phone": phone,
        "name": name,
        "breed": breed,
        "email": email,
        "pet": pet,
        "observations": observations,
        "date": date,
      };

  static AgendedDate fromSnapshot(DocumentSnapshot snap) {
    return AgendedDate(
      address: snap.data['address'],
      phone: snap.data['phone'],
      name: snap.data['name'],
      breed: snap.data['breed'],
      email: snap.data['email'],
      pet: snap.data['pet'],
      observations: snap.data['observations'],
      date: snap.data['date'],
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
      "observations": observations,
      "date": date,
    };
  }
}
