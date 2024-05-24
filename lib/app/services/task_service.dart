import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_ease/app/model/task_model.dart';

class TaskService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<void> createTask(Task task) async {
  //   await _db
  //       .collection('users')
  //       .doc(task.userId)
  //       .collection('tasks')
  //       .add(task.toMap());
  // }

 
  Stream<List<Task>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> updateTask(Task task) async {
    await _db.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }
}
