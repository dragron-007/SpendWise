import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/expense_model.dart';

class ExpenseChart extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseChart({required this.expenses});

  @override
  Widget build(BuildContext context) {
    Map<String, double> categoryAmounts = {};

    for (var expense in expenses) {
      if (categoryAmounts.containsKey(expense.category)) {
        categoryAmounts[expense.category] = categoryAmounts[expense.category]! + expense.amount;
      } else {
        categoryAmounts[expense.category] = expense.amount;
      }
    }

    List<PieChartSectionData> sections = categoryAmounts.entries.map((entry) {
      return PieChartSectionData(
        value: entry.value,
        title: '${entry.key}: \$${entry.value.toStringAsFixed(2)}',
        color: getColorForCategory(entry.key),
      );
    }).toList();

    return PieChart(PieChartData(
      sections: sections,
      centerSpaceRadius: 50,
      sectionsSpace: 2,
    ));
  }

  Color getColorForCategory(String category) {
    switch (category) {
      case 'Food':
        return Colors.blue;
      case 'Transport':
        return Colors.green;
      case 'Entertainment':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
