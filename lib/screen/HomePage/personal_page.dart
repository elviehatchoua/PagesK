import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
    String userName;
  PersonalPage({required this.userName,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        actions: []
      ),
    );
  }
}