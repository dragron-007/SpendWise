import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final String? id; // Make id nullable
  final String description;
  final String category;
  final double amount;
  final DateTime date;

  Expense({
    this.id, // Initialize id in the constructor
    required this.description,
    required this.category,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'category': category,
      'amount': amount,
      'date': date.toIso8601String(), // Store date as ISO 8601 string
    };
  }

  // Create a factory method to generate an Expense from Firestore document
  factory Expense.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
    return Expense(
      id: doc.id, // Assign the document ID
      description: data['description'],
      category: data['category'],
      amount: data['amount'],
      date: DateTime.parse(data['date']),
    );
  }
}
