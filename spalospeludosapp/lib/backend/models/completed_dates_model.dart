import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CompletedDate {
  CompletedDate({this.id, this.data});

  final String id;
  final DataCompletedDate data;

  CompletedDate copyWith({
    String id,
    String data,
  }) =>
      CompletedDate(
        id: id ?? this.id,
        data: data ?? this.data,
      );

  factory CompletedDate.fromJson(String str) => CompletedDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompletedDate.fromMap(Map<String, dynamic> json) => CompletedDate(
        id: json["id"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data,
      };

  static CompletedDate fromSnapshot(DocumentSnapshot snap) {
    return CompletedDate(
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
class DataCompletedDate {
  DataCompletedDate({
    this.address,
    this.phone,
    this.name,
    this.breed,
    this.email,
    this.pet,
    this.observations,
    this.date,
    this.comments,
    this.total,
  });

  final String address;
  final int phone;
  final String name;
  final String breed;
  final String email;
  final String pet;
  final String observations;
  final String date;
  final String comments;
  final String total;

  DataCompletedDate copyWith({
    String address,
    int phone,
    String name,
    String breed,
    String email,
    String pet,
    String observations,
    String date,
    String comments,
    String total,
  }) =>
      DataCompletedDate(
        address: address ?? this.address,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        breed: breed ?? this.breed,
        email: email ?? this.email,
        pet: pet ?? this.pet,
        observations: observations ?? this.observations,
        date: date ?? this.date,
        comments: comments ?? this.comments,
        total: total ?? this.total,
      );

  factory DataCompletedDate.fromJson(String str) =>
      DataCompletedDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataCompletedDate.fromMap(Map<String, dynamic> json) => DataCompletedDate(
        address: json["address"],
        phone: json["phone"],
        name: json["name"],
        breed: json["breed"],
        email: json["email"],
        pet: json["pet"],
        observations: json["observations"],
        date: json["date"],
        comments: json["comments"],
        total: json["total"],
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
        "comments": comments,
        "total": total,
      };

  static DataCompletedDate fromSnapshot(DocumentSnapshot snap) {
    return DataCompletedDate(
      address: snap.data['address'],
      phone: snap.data['phone'],
      name: snap.data['name'],
      breed: snap.data['breed'],
      email: snap.data['email'],
      pet: snap.data['pet'],
      observations: snap.data['observations'],
      date: snap.data['date'],
      comments: snap.data['comments'],
      total: snap.data['total'],
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
      "comments": comments,
      "total": total,
    };
  }
}
