import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMMMd();

enum Category { food, leisure, work, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
};

class Task {
  Task({required this.title, required this.date, required this.category}): id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}