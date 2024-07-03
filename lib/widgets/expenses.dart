import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true, //content stays away from device fatures like camera or notch
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
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
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
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

  @override
  Widget build(BuildContext context) {//build exdcutes again if we rotate device

    //to get width available
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      //ui accd to width av due to orientation
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(children: [
              Expanded( //give size constraints
                child: Chart(expenses: _registeredExpenses),
              ),
              Expanded(
                child: mainContent,
              ),
            ]),
    );
  }
}

/*
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

//when we add expense, we need to see updated expense list 
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [ 
    //dummy expenses
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

//add expense modal -> new_expense.dart
  void _openAddExpenseOverlay() {
    //modal overlay-it opens at bottom and background gets darker, click bg to exit modal bottom
    showModalBottomSheet(//bottom se niklega
      isScrollControlled: true, //keyborad doesnt hide addexpense overlay, overlay now takes full screen
      context: context, //meta data specific to the widget
      builder: (ctx) => NewExpense(onAddExpense: _addExpense), //ctx-context object for modal element thats created by flutter
    );
  }

//to add new expense
//executed from above
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense); //add in current list
    });
  }

//to swipe to remove
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense); //get index of expense item

    setState(() {
      _registeredExpenses.remove(expense); //removed from list
    });

//to show/hide ui elements
    ScaffoldMessenger.of(context).clearSnackBars(); //clear info mssgs of earlier in case of multiple ones
    ScaffoldMessenger.of(context).showSnackBar( //info mssg shown on screen at bottom
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          //button to get back what we deleted
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense); //add wht we deletd to where it was earlier ie same index
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar( //automatically sets other widgets
        //toolbar at top with add button
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton( //button with just icon
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          //chart
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
*/