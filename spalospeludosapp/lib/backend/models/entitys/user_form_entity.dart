import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserFormEntity extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  UserFormEntity(this.task, this.id, this.note, this.complete);

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'UserFormEntity { complete: $complete, task: $task, note: $note, id: $id }';
  }

  static UserFormEntity fromJson(Map<String, Object> json) {
    return UserFormEntity(
      json['task'] as String,
      json['id'] as String,
      json['note'] as String,
      json['complete'] as bool,
    );
  }

  static UserFormEntity fromSnapshot(DocumentSnapshot snap) {
    return UserFormEntity(
      snap.data['task'],
      snap.documentID,
      snap.data['note'],
      snap.data['complete'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
    };
  }

  @override
  // TODO: implement props
  List<Object> get props => [props];
  }