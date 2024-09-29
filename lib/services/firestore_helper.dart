import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expense_model.dart';

class FirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExpense(Expense expense) async {
    try {
      await _firestore.collection('expenses').add(expense.toMap());
    } catch (e) {
      throw Exception('Failed to add expense: $e');
    }
  }

  Future<List<Expense>> getUserExpenses() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('expenses').get();
      return snapshot.docs.map((doc) {
        return Expense.fromDocument(doc); // Use the fromDocument method
      }).toList();
    } catch (e) {
      throw Exception('Failed to get user expenses: $e');
    }
  }

  Future<void> deleteExpense(String id) async {
    try {
      await _firestore.collection('expenses').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete expense: $e');
    }
  }
}
