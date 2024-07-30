import 'package:flutter/material.dart';

import 'package:task_planner/models/task.dart';
import 'package:task_planner/views/widgets/task_item.dart';

class TasksLists extends StatelessWidget {
  const TasksLists({super.key, required this.tasks, required this.onRemoveTask});

  final List<Task> tasks;
  final void Function(Task task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskItem(tasks[index]),
    );
  }
}