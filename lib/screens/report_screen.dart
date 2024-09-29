import 'package:flutter/material.dart';
import 'CommonNavBar.dart';
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report"),),
      bottomNavigationBar: CommonNavBar(
        currentIndex: 0, // Since this is the HomeScreen, set index to 0
        onTap: (index) {
          // You can customize what happens when tapping different icons
        },
      ),
    );
  }
}
