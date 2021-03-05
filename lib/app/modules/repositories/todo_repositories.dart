import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluterandotodoslidy/app/modules/models/todo_model.dart';

import 'todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  FirebaseFirestore firestore;
  TodoRepository(this.firestore);
  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection('todo').snapshots().map((query) {
      return query.docs.map((doc) {
        return TodoModel.fromDocs(doc);
      }).toList();
    });
    //FirebaseFirestore.instance
  }
}
