//blueprint for each expense
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; //to dynamically gen unique id for each expense

import 'package:intl/intl.dart';

final formatter = DateFormat.yMd(); //obg to foramt date

const uuid = Uuid(); //outside class so u can use it everywhere in this file

enum Category { food, travel, leisure, work } //allowed predefined values

const categoryIcons = { //category to icons map
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  //cons
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //initialize uuid when obj created

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

//getter -skip ()
  String get formattedDate {
    return formatter.format(date); //intl package
  }
}

//for chart to hold up summed data for each expense category
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

//addn/alternative cons fn
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) //expenses of a category
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

//getter for sum of exp of all categories so we adjust the height of each category bar relative to total sum
  double get totalExpenses {
    double sum = 0;

    //for in loop
    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }
    return sum;
  }
}