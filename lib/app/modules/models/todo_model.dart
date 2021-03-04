import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  DocumentReference reference;
  TodoModel({this.title, this.check, this.reference});

  factory TodoModel.fromDocs(DocumentSnapshot doc) {
    return TodoModel(
        title: doc['title'], check: doc['check'], reference: doc.reference);
  }

  save() {
    if (reference == null) {
    } else {
      reference.update({
        'title': title,
        'check': check,
      });
    }
  }
}
