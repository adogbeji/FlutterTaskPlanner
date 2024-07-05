import 'package:flutter/material.dart';
import 'package:task_planner/views/screens/start_screen.dart';
import 'package:task_planner/views/screens/tasks_screen.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'tasks-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(onStartTasks: switchScreen);

    if (activeScreen == 'tasks-screen') {
      screenWidget = TasksScreen();
    }

    return Scaffold(
      body: screenWidget,
    );
  }
}