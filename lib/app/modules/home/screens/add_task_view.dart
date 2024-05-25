import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_ease/app/modules/home/components/custom_field.dart';
import 'package:test_ease/app/modules/home/controllers/home_controller.dart';
import 'package:test_ease/utils/common/app_colors.dart';
import 'package:test_ease/utils/common/custom_button.dart';
import 'package:test_ease/utils/helper/helper.dart';

class AddTaskView extends GetView<HomeController> {
  final String? taskId;
  final String initialTitle;
  final String initialDescription;
  final String initialDeadline;
  final String initialDuration;
  final bool initialCompleted;
  final bool isEditing;
  AddTaskView({
    Key? key,
    this.taskId,
    this.initialTitle = '',
    this.initialDescription = '',
    this.initialDeadline = '',
    this.initialDuration = '',
    this.initialCompleted = false,
  })  : isEditing = taskId != null,
        super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _expectedDurationController =
      TextEditingController();
  final RxBool _isCompleted = RxBool(false);

  @override
  Widget build(BuildContext context) {
    _titleController.text = initialTitle;
    _descriptionController.text = initialDescription;
    _deadlineController.text = initialDeadline;
    _expectedDurationController.text = initialDuration;
    _isCompleted.value = initialCompleted;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.blueColor, title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(controller: _titleController,
              validator: (p0) => validatEmpty(p0),),
              CustomTextField(controller: _descriptionController,
              validator: (p0) => validatEmpty(p0), ),
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
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      final DateTime fullDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      _deadlineController.text =
                          DateFormat('yyyy-MM-dd HH:mm').format(fullDateTime);
                    }
                  }
                },
                validator: (value) =>validatEmpty(value),
              ),
                CustomTextField(controller: _expectedDurationController,
                labeText: 'Duration',
              validator: (p0) => validatDuration(p0),),
             
              Obx(() => CheckboxListTile(
                    title: const Text('Completed'),
                    value: _isCompleted.value,
                    onChanged: (newValue) {
                      _isCompleted.value = newValue!;
                    },
                  )),
              const SizedBox(height: 20),
              CustomButton(
                title: Text(isEditing ? 'Update Task' : 'Add Task'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      if (isEditing) {
                        await controller.updateTask(
                          id: taskId!,
                          title: _titleController.text,
                          description: _descriptionController.text,
                          deadline: _deadlineController.text,
                          duration: _expectedDurationController.text,
                        );
                      } else {
                        await controller.addTask(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          deadline: _deadlineController.text,
                          duration: _expectedDurationController.text,
                        );
                      }
                      Get.back();
                    } catch (e) {
                      Get.snackbar('Error', '$e',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  } else {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

