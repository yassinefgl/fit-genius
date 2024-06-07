import 'package:flutter/material.dart';
import 'DiabeteP.dart';

class WeightSelectionPage extends StatefulWidget {
  @override
  _WeightSelectionPageState createState() => _WeightSelectionPageState();
}

class _WeightSelectionPageState extends State<WeightSelectionPage> {
  int _selectedWeight = 77;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Action when back button is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "What's Your Weight?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "How tall are you?",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                onSelectedItemChanged: (index) {
                  setState(() {
                    _selectedWeight = 73 + index;
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final weight = 73 + index;
                    final isSelected = weight == _selectedWeight;
                    return Center(
                      child: Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: isSelected ? 24 : 18,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.orange : Colors.black,
                        ),
                      ),
                    );
                  },
                  childCount: 9,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KG',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Action when Skip is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiabetesPredictorApp()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.orange),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Action when Continue is pressed
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiabetesPredictorApp()),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
