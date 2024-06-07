import 'package:flutter/material.dart';
import 'male_page.dart';  // Importez la page Male
import 'female_page.dart';  // Importez la page Female

// Enum for gender options
enum Gender { Male, Female }

class GenderSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Gender'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Select Your Gender',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's start by understanding you",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GenderOption(
                      imagePath: 'assets/male.png',
                      label: 'Male',
                      gender: Gender.Male,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MalePage()),
                        );
                      },
                    ),
                    GenderOption(
                      imagePath: 'assets/female.png',
                      label: 'Female',
                      gender: Gender.Female,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FemalePage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for the Skip button
                    // You can add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade100, // Background color
                    foregroundColor: Colors.black, // Text color
                  ),
                  child: Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for the Continue button
                    // You can add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widget for gender option
class GenderOption extends StatelessWidget {
  final String imagePath;
  final String label;
  final Gender gender;
  final VoidCallback onTap;

  const GenderOption({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.gender,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 150,
        ),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade100, // Background color
            foregroundColor: Colors.black, // Text color
          ),
          child: Text(label),
        ),
      ],
    );
  }
}
