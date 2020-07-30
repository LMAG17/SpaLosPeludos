import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AgendedDate {
  AgendedDate({this.id, this.data});

  final String id;
  final DataAgendedDate data;

  AgendedDate copyWith({
    String id,
    String data,
  }) =>
      AgendedDate(
        id: id ?? this.id,
        data: data ?? this.data,
      );

  factory AgendedDate.fromJson(String str) => AgendedDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AgendedDate.fromMap(Map<String, dynamic> json) => AgendedDate(
        id: json["id"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data,
      };

  static AgendedDate fromSnapshot(DocumentSnapshot snap) {
    return AgendedDate(
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

class DataAgendedDate {
  DataAgendedDate({
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

  DataAgendedDate copyWith({
    String address,
    int phone,
    String name,
    String breed,
    String email,
    String pet,
    String observations,
    String date,
  }) =>
      DataAgendedDate(
        address: address ?? this.address,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        breed: breed ?? this.breed,
        email: email ?? this.email,
        pet: pet ?? this.pet,
        observations: observations ?? this.observations,
        date: date ?? this.date,
      );

  factory DataAgendedDate.fromJson(String str) =>
      DataAgendedDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataAgendedDate.fromMap(Map<String, dynamic> json) => DataAgendedDate(
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

  static DataAgendedDate fromSnapshot(DocumentSnapshot snap) {
    return DataAgendedDate(
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
