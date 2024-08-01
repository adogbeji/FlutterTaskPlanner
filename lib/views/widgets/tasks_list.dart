import 'package:flutter/material.dart';

import 'package:task_planner/models/task.dart';
import 'package:task_planner/views/widgets/task_item.dart';

class TasksLists extends StatelessWidget {
  const TasksLists(
      {super.key, required this.tasks, required this.onRemoveTask});

  final List<Task> tasks;
  final void Function(Task task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(tasks[index]),
        onDismissed:(direction) {
          onRemoveTask(tasks[index]);
        },
        child: TaskItem(tasks[index]),
      ),
    );
  }
}
