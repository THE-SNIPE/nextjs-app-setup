import 'package:flutter/material.dart';

class FarmerVetListScreen extends StatefulWidget {
  @override
  _FarmerVetListScreenState createState() => _FarmerVetListScreenState();
}

class _FarmerVetListScreenState extends State<FarmerVetListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VetJirani - Vet Clinics'),
        backgroundColor: Color(0xFF162013),
      ),
      body: Center(
        child: Text(
          'Vet Clinic List View - To be implemented',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
