import 'package:expense_tracker_application/screens/report_screen.dart';
import 'package:expense_tracker_application/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_expense_screen.dart';

class CommonNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CommonNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => AddExpenseScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => ReportScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
            break;
          default:
            onTap(index); // Calls the provided callback function if index is out of range
            break;
        }
      },
      type: BottomNavigationBarType.fixed, // Ensures proper item display for more than 3 items
      elevation: 5,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Expense',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Reports',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.black87,
        ),
      ],
      selectedItemColor: Colors.green, // Customize for active item color
      unselectedItemColor: Colors.grey, // Customize for inactive items
    );
  }
}
