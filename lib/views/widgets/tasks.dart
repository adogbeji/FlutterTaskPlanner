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

  // Removes Task
  void _removeTask(Task task) {
    final taskIndex = _registeredTasks.indexOf(task);  // Index value of task

    setState(() {
      _registeredTasks.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();  // Removes all existing info messages ("snack bars")
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Task Removed!'),
        action: SnackBarAction(
          onPressed: () {
            setState(() {
              _registeredTasks.insert(taskIndex, task);  // Brings back deleted task
            });
          },
          label: 'Undo',
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(onStartTasks: switchScreen);

    // if (activeScreen == 'tasks-screen' && _registeredTasks.isNotEmpty) {
    //   screenWidget = TasksScreen(tasks: _registeredTasks, onAddTask: _addTask, onRemoveTask: _removeTask,);
    // }

    if (activeScreen == 'tasks-screen') {
      screenWidget = TasksScreen(tasks: _registeredTasks, onAddTask: _addTask, onRemoveTask: _removeTask,);
    }

    // if (activeScreen == 'tasks-screen' && _registeredTasks.isEmpty) {
    //   screenWidget = const Center(
    //     child: Text('No Tasks Added!'),
    //   );
    // }

    return Scaffold(
      body: screenWidget,
    );
  }
}