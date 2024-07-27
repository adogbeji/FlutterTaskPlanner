import 'package:flutter/material.dart';

import 'package:task_planner/models/task.dart';

class TasksLists extends StatelessWidget {
  const TasksLists({super.key, required this.tasks, required this.onRemoveTask});

  final List<Task> tasks;
  final void Function(Task task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tasks List'),
      ),
    );
  }
}