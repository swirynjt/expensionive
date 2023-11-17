import 'dart:math';

import 'package:expensionive/main.dart';
import 'package:expensionive/widgets/expenses_list/expenses_list.dart';
import 'package:expensionive/models/expense.dart';
import 'package:expensionive/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expensionive extends StatefulWidget {
  const Expensionive({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensioniveState();
  }
}

class _ExpensioniveState extends State<Expensionive> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Unity registration',
        amount: 0.00,
        date: DateTime(2022, 2, 2),
        category: Category.scam),
    Expense(
      title: 'Buying Ion trees (Not sinister)',
      amount: 123456.99,
      date: DateTime.now(),
      category: Category.scam,
    ),
    Expense(
      title: '"Outlive pets"',
      amount: 20.00,
      date: DateTime(1479, 4, 29),
      category: Category.evading,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: addExpense);
      },
    );
  }

  void addExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Isn\'t keep track of'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
          },
        ),
      ),
    );
  }

// boo i am a scary ghost in your computer
  void _openStoryOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const Expanded(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wheelchair_pickup),
                  Icon(Icons.paragliding),
                  Icon(Icons.accessibility_new),
                  Icon(Icons.accessible_rounded),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('That cautIONary tale')
            ],
          )));
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Don\'t find. Started adding a several!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            //Story button (not important)
            onPressed: _openStoryOverlay,
            icon: const Icon(Icons.book),
          )
        ],
        title: const Text('ExpensIONive'),
      ),
      body: Column(
        children: [
          const Text('GFDS'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
