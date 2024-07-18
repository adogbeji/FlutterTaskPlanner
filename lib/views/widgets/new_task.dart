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
  DateTime? _selectedDate;

  // Shows Datepicker
  Future<void> _openDatePicker()  async {
    final today = DateTime.now();
    final defaultDate = DateTime(today.year, today.month, today.day);
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    final lastDate = DateTime(today.year, today.month, today.day + 7);

    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: defaultDate,
      firstDate: firstDate, 
      lastDate: lastDate
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

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
                onPressed: _openDatePicker,
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
        ],
      ),
    );
  }
}