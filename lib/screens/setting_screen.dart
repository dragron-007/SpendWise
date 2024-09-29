import 'package:flutter/material.dart';
import 'CommonNavBar.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("asdfg"),),
      bottomNavigationBar: CommonNavBar(
        currentIndex: 0, // Since this is the HomeScreen, set index to 0
        onTap: (index) {
          // You can customize what happens when tapping different icons
        },
      ),
    );
  }
}
