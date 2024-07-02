import 'package:flutter/material.dart';
import 'package:task_planner/views/screens/start_screen.dart';

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
    var screenWidget = StartScreen(onStartTasks: switchScreen);

    return Scaffold(
      body: screenWidget,
    );
  }
}