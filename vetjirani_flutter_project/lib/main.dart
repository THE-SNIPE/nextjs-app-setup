import 'package:flutter/material.dart';
import 'screens/authentication_screen.dart';

void main() {
  runApp(VetJiraniApp());
}

class VetJiraniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetJirani',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF53D22C),
        scaffoldBackgroundColor: Color(0xFF162013),
        fontFamily: 'Manrope',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF53D22C),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: RoleSelectionScreen(),
    );
  }
}

class RoleSelectionScreen extends StatefulWidget {
  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedRole;

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
    // TODO: Save role locally and in Firebase on login
    // Navigate to Authentication screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthenticationScreen(role: role)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VetJirani'),
        centerTitle: true,
        backgroundColor: Color(0xFF162013),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose who you are',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => selectRole('Farmer'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF53D22C),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("I'm a Farmer", style: TextStyle(color: Color(0xFF162013), fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectRole('Vet Clinic'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2E4328),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("I'm a Vet Clinic", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
