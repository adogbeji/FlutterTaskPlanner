import 'package:flutter/material.dart';
import 'package:task_planner/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({required this.tasks, required this.onRemoveTask, super.key});

  final List<Task> tasks;
  final void Function(Task task) onRemoveTask;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Task Planner'),
        actions: [Icon(Icons.add,),],
      ),
      body: Center(
        child: Text('Tasks Screen'),
      ),
    );
  }
}