// lib/next_page.dart
import 'package:flutter/material.dart';
import 'gender_selection_page.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Naviguer vers GenderSelectionPage après 2 secondes
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GenderSelectionPage()),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image en haut
            Image.asset(
              'assets/track_goal.png', 
              height: 300,
            ),
            SizedBox(height: 20),
            // Titre
            Text(
              'Track Your Goal',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Description
            Text(
              "Don't worry if you have trouble determining your goals. We can help you determine your goals and track your goals",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
