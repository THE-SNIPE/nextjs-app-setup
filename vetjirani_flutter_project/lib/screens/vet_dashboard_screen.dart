import 'package:flutter/material.dart';

class VetDashboardScreen extends StatefulWidget {
  @override
  _VetDashboardScreenState createState() => _VetDashboardScreenState();
}

class _VetDashboardScreenState extends State<VetDashboardScreen> {
  int newBookings = 0;
  int confirmed = 0;
  int pending = 0;
  int declined = 0;
  bool isAvailable = true;

  @override
  void initState() {
    super.initState();
    // TODO: Load booking counts and availability status from Firebase
  }

  void toggleAvailability(bool value) {
    setState(() {
      isAvailable = value;
    });
    // TODO: Update availability status in Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VetJirani - Vet Dashboard'),
        backgroundColor: Color(0xFF171F14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStatusCard('New', newBookings, Color(0xFF2F402B)),
                _buildStatusCard('Confirmed', confirmed, Color(0xFF2F402B)),
                _buildStatusCard('Pending', pending, Color(0xFF2F402B)),
                _buildStatusCard('Declined', declined, Color(0xFF2F402B)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Availability',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isAvailable,
                  onChanged: toggleAvailability,
                  activeColor: Color(0xFF8CD279),
                  inactiveThumbColor: Color(0xFF2E4328),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, int count, Color color) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 8),
          Text(count.toString(), style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
