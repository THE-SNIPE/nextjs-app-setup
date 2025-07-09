import 'package:flutter/material.dart';

class RatingsFeedbackScreen extends StatefulWidget {
  @override
  _RatingsFeedbackScreenState createState() => _RatingsFeedbackScreenState();
}

class _RatingsFeedbackScreenState extends State<RatingsFeedbackScreen> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();

  void _submitFeedback() {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a rating')),
      );
      return;
    }
    // TODO: Submit rating and feedback to Firebase
    print('Rating: $_rating, Comment: ${_commentController.text}');
  }

  Widget _buildStar(int starIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = starIndex;
        });
      },
      child: Icon(
        Icons.star,
        color: starIndex <= _rating ? Color(0xFF8CD279) : Colors.grey,
        size: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews & Ratings'),
        backgroundColor: Color(0xFF162013),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'How was your experience?',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => _buildStar(index + 1)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _commentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Share your feedback',
                hintStyle: TextStyle(color: Color(0xFFA4BE9D)),
                filled: true,
                fillColor: Color(0xFF2F402B),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitFeedback,
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
    );
  }
}
