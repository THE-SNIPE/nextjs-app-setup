import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF162013),
      ),
      body: Center(
        child: Text(
          'Settings Screen - To be implemented',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
