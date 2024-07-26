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
  Category _selectedCategory = Category.leisure;
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
  
  // Saves new tasks
  void _addNewTask() {
    final enteredPrice = double.tryParse(_priceController.text);
    final priceIsInvalid = enteredPrice == null || enteredPrice <= 0;
    if (_nameController.text.trim().isEmpty || priceIsInvalid || _selectedDate == null) {
      // Show error message below
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text('Please enter a valid name, date & category'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;  // stops function execution
    }

    widget.onAddTask(
      Task(
        title: _nameController.text, 
        date: _selectedDate!, 
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);  // Closes dialog
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
              Text(_selectedDate == null ?
                'No date selected!': formatter.format(_selectedDate!),
              ),
              IconButton(
                onPressed: _openDatePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),

          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.toUpperCase(),),
                ),).toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              ElevatedButton(onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent.shade100,
              ),
              child: Text('Save'),),
            ],
          ),
        ],
      ),
    );
  }
}