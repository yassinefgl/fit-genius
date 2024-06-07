import 'package:flutter/material.dart';
import 'weight_selection_page.dart';

class HeightSelectionPage extends StatefulWidget {
  @override
  _HeightSelectionPageState createState() => _HeightSelectionPageState();
}

class _HeightSelectionPageState extends State<HeightSelectionPage> {
  int _selectedHeight = 185;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Action when back button is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "What's Your Height?",
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
                    _selectedHeight = 120 + index;
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final height = 120 + index;
                    final isSelected = height == _selectedHeight;
                    return Center(
                      child: Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: isSelected ? 24 : 18,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.orange : Colors.black,
                        ),
                      ),
                    );
                  },
                  childCount: 100,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CM',
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
                      MaterialPageRoute(builder: (context) => WeightSelectionPage()),
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
                      MaterialPageRoute(builder: (context) => WeightSelectionPage()),
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
