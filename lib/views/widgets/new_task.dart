import 'package:flutter/material.dart';
import 'package:task_planner/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({required this.onAddTask, super.key});

  final void Function(Task task) onAddTask;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter task name...',
            ),
          ),

          Row(
            children: [
              Text('No date selected'),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
        ],
      ),
    );
  }
}