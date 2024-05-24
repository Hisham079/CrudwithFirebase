import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/app/modules/home/screens/add_task_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
             Get.find<AuthController>().signOut();
            },
          ),
        ],
      ),body:
      StreamBuilder<QuerySnapshot>(
        stream: controller.getTasksStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var tasks = snapshot.data!.docs;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index];
              return ListTile(
                title: Text(task['title']),
                subtitle: Text(task['description']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                         Get.to(() => AddTaskView(
                          taskId: task.id,
                          initialTitle: task['title'],
                          initialDescription: task['description'],
                          initialDeadline: task['deadline'],
                          initialDuration: task['expected_duration'],
                        ));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        try {
                          await controller.deleteTask(task.id);
                        } catch (error) {
                          Get.snackbar('Error', '$error', snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
     
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to add task screen
          Get.to(() => AddTaskView());
        },
      ),
    );
  }
}
