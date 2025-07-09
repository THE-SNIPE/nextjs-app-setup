import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _animalType;
  String? _description;
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        backgroundColor: Color(0xFF171F14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Animal Type',
                  filled: true,
                  fillColor: Color(0xFF2F402B),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: ['Cattle', 'Goat', 'Poultry', 'Other']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _animalType = value;
                  });
                },
                validator: (value) => value == null ? 'Please select an animal type' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Describe the issue (optional)',
                  filled: true,
                  fillColor: Color(0xFF2F402B),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onSaved: (value) {
                  _description = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Color(0xFF53D22C),
                            onPrimary: Colors.black,
                            surface: Color(0xFF2F402B),
                            onSurface: Colors.white,
                          ),
                          dialogBackgroundColor: Color(0xFF162013),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: Color(0xFF53D22C),
                              onPrimary: Colors.black,
                              surface: Color(0xFF2F402B),
                              onSurface: Colors.white,
                            ),
                            dialogBackgroundColor: Color(0xFF162013),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (time != null) {
                      setState(() {
                        _selectedDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                      });
                    }
                  }
                },
                child: Text(_selectedDateTime == null
                    ? 'Select Date & Time'
                    : 'Selected: \${_selectedDateTime!.toLocal()}'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF53D22C),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _selectedDateTime != null) {
                    _formKey.currentState!.save();
                    // TODO: Submit booking to Firebase and trigger FCM
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please complete all required fields')),
                    );
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8CD279),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
