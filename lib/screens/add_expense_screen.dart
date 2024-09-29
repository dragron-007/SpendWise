import 'package:flutter/material.dart';
import '../models/expense_model.dart';
import '../services/firestore_helper.dart';
import 'CommonNavBar.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () async {
                final expense = Expense(
                  description: _descriptionController.text,
                  category: 'General', // Modify as needed for category selection
                  amount: double.parse(_amountController.text),
                  date: DateTime.now(), // Add the current date for the expense
                );
                try {
                  await FirestoreHelper().addExpense(expense);
                  Navigator.pop(context); // Close the screen after adding the expense
                } catch (e) {
                  // Handle the error, for example show a dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text(e.toString()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonNavBar(
        currentIndex: 0, // Since this is the HomeScreen, set index to 0
        onTap: (index) {
          // You can customize what happens when tapping different icons
        },
      ),
    );
  }
}
