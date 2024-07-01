import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.onStartTasks, super.key});

  final void Function() onStartTasks;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Start Screen'),
      ),
    );
  }
}