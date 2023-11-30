import 'dart:math';

import 'package:expensionive/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expensionive/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
          ),
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
