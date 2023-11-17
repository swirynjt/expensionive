import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {
  bail,
  eating,
  sleeping,
  evading,
  tides,
  wives,
  landslides,
  scam,
}

const categoryIcons = {
  Category.bail: Icons.celebration,
  Category.eating: Icons.cake,
  Category.sleeping: Icons.fast_forward,
  Category.evading: Icons.directions_run,
  Category.tides: Icons.downhill_skiing,
  Category.wives: Icons.bug_report,
  Category.landslides: Icons.macro_off,
  Category.scam: Icons.gpp_maybe,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
