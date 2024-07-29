import 'package:flutter/material.dart';
import 'package:task_planner/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(task.title),
        ],
      ),
    );
  }
}