import 'package:flutter/material.dart';
import '../models/expense_model.dart';
import '../services/firestore_helper.dart';
import 'CommonNavBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> _expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses(); // Call the method to load expenses when the screen is initialized
  }

  // Define the _loadExpenses method
  Future<void> _loadExpenses() async {
    try {
      final expenses = await FirestoreHelper().getUserExpenses();
      setState(() {
        _expenses = expenses; // Update the state with the fetched expenses
      });
    } catch (e) {
      // Handle errors accordingly
      print('Error loading expenses: $e');
    }
  }

  Future<void> _deleteExpense(String id) async {
    await FirestoreHelper().deleteExpense(id);
    _loadExpenses(); // Reload expenses after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _expenses.length,
          itemBuilder: (context, index) {
            final expense = _expenses[index];
            return ListTile(
              title: Text(expense.description),
              subtitle: Text('Amount: \$${expense.amount.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteExpense(expense.id!), // Use the id to delete
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CommonNavBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
