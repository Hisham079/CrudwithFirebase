import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

      

  Future<void> addTask({
    required String title,
    required String description,
    required String deadline,
    required String duration,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
         await tasks.add({
          'uid': user.uid,
          'title': title,
          'description': description,
          'deadline': deadline,
          'expected_duration': duration,
          'completed': false,
        });
      } else {
        throw 'User is not authenticated';
      }
    } catch (e) {
      throw 'Failed to add task: $e';
    }
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

  Future<void> completeTask(String id, bool isCompleted) async {
    try {
      await tasks.doc(id).update({'completed': isCompleted});
    } catch (error) {
      throw 'Failed to update task completion: $error';
    }
  }

  Stream<QuerySnapshot> getTasksStream() {
    User? user = _auth.currentUser;
    if (user != null) {
      return tasks.where('uid', isEqualTo: user.uid).snapshots();
    } else {
      return Stream.empty();
    }
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
