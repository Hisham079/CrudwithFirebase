import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/model/task_model.dart';
import 'package:test_ease/app/modules/home/controllers/home_controller.dart';

class AddTaskView extends GetView<HomeController> {
  final String? taskId;
  final String initialTitle;
  final String initialDescription;
  final String initialDeadline;
  final String initialDuration;
  final bool isEditing;
  AddTaskView({
    Key? key,
    this.taskId,
    this.initialTitle = '',
    this.initialDescription = '',
    this.initialDeadline = '',
    this.initialDuration = '',
  })  : isEditing = taskId != null,
        super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _expectedDurationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = initialTitle;
    _descriptionController.text = initialDescription;
    _deadlineController.text = initialDeadline;
    _expectedDurationController.text = initialDuration;
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deadlineController,
                decoration: const InputDecoration(labelText: 'Deadline'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    _deadlineController.text = pickedDate.toIso8601String();
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a deadline';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _expectedDurationController,
                decoration: const InputDecoration(
                    labelText: 'Expected Duration (minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter expected duration';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    try {
                      if(isEditing){
                        await controller.updateTask(
                          id: taskId!,
                          title: _titleController.text,
                          description: _descriptionController.text,
                          deadline: _deadlineController.text,
                          duration: _expectedDurationController.text,
                        );
                      }else{
                         await controller.addTask(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          deadline: _deadlineController.text,
                          duration: _expectedDurationController.text,
                        );
                      }
                         Get.back();
                    } catch (e) {
                       Get.snackbar('Error', '$e', snackPosition: SnackPosition.BOTTOM);
                    }
                 
                  } else {
                  }
                },
                child: Text(isEditing ? 'Update Task' : 'Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
