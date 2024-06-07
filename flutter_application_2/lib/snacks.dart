import 'package:flutter/material.dart';

class SnacksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> snacks = [
    {
      'icon': Icons.local_fire_department,
      'title': 'Top High-Protein Snacks',
    },
    {
      'icon': Icons.local_florist,
      'title': 'Top High-Fiber Snacks',
    },
    {
      'icon': Icons.medical_services,
      'title': 'Best aliments for diabetic people',
    },
    {
      'icon': Icons.warning,
      'title': 'Aliments to avoid for diabetic people',
    },
    // Ajoutez plus d'items ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diaporama Horizontal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Snacks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Being offered a snack can be beneficial in stabilizing your blood sugar. Here are several healthy snack ideas you might consider, in consultation with a registered dietitian to complement your diabetes-friendly eating plan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snacks.length,
                itemBuilder: (context, index) {
                  return SnackCard(
                    icon: snacks[index]['icon']!,
                    title: snacks[index]['title']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnackCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const SnackCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 80,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SnacksScreen(),
  ));
}
