import 'package:flutter/material.dart';
import 'package:task_planner/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({required this.onAddTask, super.key});

  final void Function(Task task) onAddTask;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text('New Task'),
    );
  }
}