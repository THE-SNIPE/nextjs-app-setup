import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  final String role;

  AuthenticationScreen({required this.role});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController phoneController = TextEditingController();

  void continueWithPhone() {
    // TODO: Implement phone OTP authentication with Firebase
    print('Continue with phone: \${phoneController.text}');
  }

  void continueWithGoogle() {
    // TODO: Implement Google sign-in for Vet Clinic
    print('Continue with Google');
  }

  @override
  Widget build(BuildContext context) {
    bool isVet = widget.role == 'Vet Clinic';

    return Scaffold(
      appBar: AppBar(
        title: Text('Login - \${widget.role}'),
        backgroundColor: Color(0xFF162013),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Welcome to VetJirani',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              "Connect with trusted vets and manage your farm's health",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: TextStyle(color: Color(0xFFA2C398)),
                filled: true,
                fillColor: Color(0xFF2E4328),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: continueWithPhone,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF53D22C),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Continue with phone',
                style: TextStyle(color: Color(0xFF162013), fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Or continue with',
              style: TextStyle(color: Color(0xFFA2C398)),
            ),
            SizedBox(height: 12),
            if (isVet)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Google sign-in
                      continueWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2E4328),
                      minimumSize: Size(120, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Google',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
