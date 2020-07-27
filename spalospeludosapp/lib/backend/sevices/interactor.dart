import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spalospeludosapp/backend/models/user_form_model.dart';

class FirestoreServieInteractor {
  final firestoreInstance = Firestore.instance;
  Future<List<UserForm>> getUsersForm() async {
    var _docs = await firestoreInstance.collection("ClientForm").getDocuments();
    if (_docs.documents.isNotEmpty) {
      return _docs.documents.map((e) => UserForm.fromMap(e.data)).toList();
    }
  }
}
