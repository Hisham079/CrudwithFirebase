import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/app/modules/home/screens/add_task_view.dart';
import 'package:test_ease/utils/common/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  String formatDate(String dateStr) {
    final DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat.yMMMd().add_jm().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.find<AuthController>().signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getTasksStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text('No tasks available. Add your first task!'));
          } else {
            var tasks = snapshot.data!.docs;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var task = tasks[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(task['title']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task['description']),
                        const SizedBox(height: 5),
                        Text('Deadline: ${formatDate(task['deadline'])}'),
                        Text(
                            'Expected Duration: ${task['expected_duration']} mins'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
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
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            try {
                              await controller.deleteTask(task.id);
                            } catch (error) {
                              Get.snackbar('Error', '$error',
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blueColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => AddTaskView());
        },
      ),
    );
  }
}
