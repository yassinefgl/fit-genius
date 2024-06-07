import 'package:flutter/material.dart';

class DiabetesTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Tips'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildTipCard(
                context,
                icon: Icons.fastfood,
                title: 'Healthy Eating',
                description: 'Maintain a balanced diet with plenty of fruits, vegetables, and whole grains. Monitor carbohydrate intake and avoid sugary foods and drinks.',
              ),
              SizedBox(height: 20),
              _buildTipCard(
                context,
                icon: Icons.fitness_center,
                title: 'Regular Exercise',
                description: 'Engage in regular physical activity like walking, running, or cycling. Aim for at least 30 minutes a day, most days of the week.',
              ),
              SizedBox(height: 20),
              _buildTipCard(
                context,
                icon: Icons.monitor,
                title: 'Monitor Blood Sugar',
                description: 'Check your blood sugar levels regularly. Follow your doctor\'s advice on how often and when to check.',
              ),
              SizedBox(height: 20),
              _buildTipCard(
                context,
                icon: Icons.medication,
                title: 'Medication Adherence',
                description: 'Take your medication as prescribed by your healthcare provider. Do not skip doses and understand the side effects.',
              ),
              SizedBox(height: 20),
              _buildTipCard(
                context,
                icon: Icons.self_improvement,
                title: 'Stress Management',
                description: 'Practice stress-reducing techniques such as meditation, deep breathing, or yoga. Manage stress to help control blood sugar levels.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header for the tips page
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tips for Managing Diabetes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Taking care of your health is crucial for managing diabetes effectively. Here are some practical tips to help you stay on track:',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Function to build a styled card for each tip
  Widget _buildTipCard(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.orange,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
