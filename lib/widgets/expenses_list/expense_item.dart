import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

//output list/expense items
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card( //card look, container elevated n shadowed
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column( //2 col(title and amt,icon, date)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row( //2 rows in 2nd col
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}', //2 decimal places
                ),
                const Spacer(), //used in col/row to tell flutter to take all the remaining space 
                //row inside row to group category and date together
                Row( //display this info all the way to right
                  children: [
                    Icon(categoryIcons[expense.category]), //access specific icon
                    const SizedBox(width: 8),
                    Text(expense.formattedDate), //getter so no () //m/d/yyyy
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}