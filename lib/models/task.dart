import 'package:flutter/material.dart';

enum Category { food, leisure, work, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
};

class Task {
  final int id;
  final String title;
  final DateTime date;
}