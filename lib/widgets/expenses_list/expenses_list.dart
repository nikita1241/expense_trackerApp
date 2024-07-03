import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';

//just output list
class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses; //of Expense class
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder( //when we hv list of unknown length and can get potentially long list
    //build as we view/load //lazy loading //scrollable
      itemCount: expenses.length, //how many list items will be rendered eventually
      itemBuilder: (ctx, index) => Dismissible( //list item become swipeable
      //swipe to delete
        //arrow fn to return widget
        key: ValueKey(expenses[index]), //key-uniquely  identify widget and data asso with it so corrrect data is deleted

        //background for when we swipe to dlete
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75), //error color-red
          margin: EdgeInsets.symmetric( //margin for error color
            horizontal: Theme.of(context).cardTheme.margin!.horizontal, //set to card margin itself
          ),
        ),
        
        onDismissed: (direction) { //when u swipe away smthng, this fn is trigg
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}