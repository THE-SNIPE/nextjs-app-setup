import 'package:flutter/material.dart';

class VetBookingsScreen extends StatefulWidget {
  @override
  _VetBookingsScreenState createState() => _VetBookingsScreenState();
}

class _VetBookingsScreenState extends State<VetBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VetJirani - Bookings'),
        backgroundColor: Color(0xFF171F14),
      ),
      body: Center(
        child: Text(
          'Vet Bookings View - To be implemented',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
