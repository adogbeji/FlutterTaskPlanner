import 'package:flutter/material.dart';

import 'package:task_planner/models/task.dart';

import 'package:task_planner/views/screens/start_screen.dart';
import 'package:task_planner/views/screens/tasks_screen.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List<Task> _registeredTasks = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'tasks-screen';
    });
  }
  
  // Adds Tasks
  void _addTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
    });
  }

  void _removeTask(Task task) {}

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(onStartTasks: switchScreen);

    if (activeScreen == 'tasks-screen') {
      screenWidget = TasksScreen(tasks: _registeredTasks, onRemoveTask: _removeTask,);
    }

    return Scaffold(
      body: screenWidget,
    );
  }
}