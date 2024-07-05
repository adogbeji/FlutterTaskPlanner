import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.onStartTasks, super.key});

  final void Function() onStartTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.red,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Task Planner',
              style: TextStyle(
                fontSize: 24,
                color: Colors.yellow,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12,),

            OutlinedButton.icon(
              onPressed: onStartTasks,
              // style: OutlinedButton.styleFrom(
              //   foregroundColor: Colors.white,
              // ),
              label: const Text(
                'Start',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
