import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask({
    required String title,
    required String description,
    required String deadline,
    required String duration,
  }) {
    return tasks.add({
      'title': title,
      'description': description,
      'deadline': deadline,
      'expected_duration': duration,
    });
  }

  Future<void> updateTask({
    required String id,
    required String title,
    required String description,
    required String deadline,
    required String duration,
  }) async {
    try {
      await tasks.doc(id).update({
        'title': title,
        'description': description,
        'deadline': deadline,
        'expected_duration': duration,
      });
    } catch (error) {
      throw 'Failed to update task: $error';
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await tasks.doc(id).delete();
    } catch (error) {
      throw 'Failed to delete task: $error';
    }
  }

  Stream<QuerySnapshot> getTasksStream() {
    return tasks.snapshots();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
