import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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