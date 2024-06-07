import 'package:flutter/material.dart';

class BreakfastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Breakfast Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              padding: EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                buildMenuItem('Egg', Icons.egg),
                buildMenuItem('Pancakes', Icons.cake),
                buildMenuItem('Waffles', Icons.breakfast_dining),
                buildMenuItem('Toast', Icons.breakfast_dining),
                buildMenuItem('Smoothie Bowl', Icons.blender),
                buildMenuItem('Oatmeal', Icons.rice_bowl),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Add onTap functionality if needed
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.orangeAccent),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Start your day with a delicious breakfast!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          Icon(Icons.coffee, size: 40, color: Colors.white),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BreakfastScreen(),
  ));
}
