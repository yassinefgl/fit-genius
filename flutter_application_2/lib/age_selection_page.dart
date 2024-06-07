import 'package:flutter/material.dart';
import 'package:flutter_application_2/%20height_selection_page.dart';



class AgeSelectionPage extends StatefulWidget {
  @override
  _AgeSelectionPageState createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  int selectedAge = 28; // Default age

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How Old Are You?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Share your age with us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: ListWheelScrollView(
                  itemExtent: 60,
                  perspective: 0.007,
                  diameterRatio: 1.2,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = index + 18; // Assuming age starts from 18
                    });
                  },
                  children: List<Widget>.generate(100, (index) {
                    return Center(
                      child: Text(
                        '${index + 18}',
                        style: TextStyle(
                          fontSize: 24,
                          color: selectedAge == index + 18 ? Colors.orange : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Action for Skip
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HeightSelectionPage()), // Remplacez "NouvellePage" par le nom de votre nouvelle page
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the new page when Continue is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HeightSelectionPage()), // Remplacez "NouvellePage" par le nom de votre nouvelle page
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
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
