import 'package:flutter/material.dart';

class FantasyDashboard extends StatelessWidget {
  const FantasyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Fantasy"),
        centerTitle: true,
      ),
    );
  }
}
