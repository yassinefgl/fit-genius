import 'package:flutter/material.dart';
import 'StartExercise.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit Genius'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(context),
            SizedBox(height: 16),
            _buildProgressSection(),
            SizedBox(height: 16),
            _buildCategoriesSection(),
            SizedBox(height: 16),
            _buildExerciseList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Strong and Set Your Fitness Goals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkoutPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text('Start Exercise'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProgressCard('Chest Workout', '5/12', '15 min remaining'),
            _buildProgressCard('Legs Workout', '3/20', '23 min remaining'),
            _buildProgressCard('Arms Workout', '1/20', '23 min remaining'),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressCard(String title, String progress, String time) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              progress,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(title),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildCategoryChip('All', true),
            _buildCategoryChip('Warm Up', false),
            _buildCategoryChip('Yoga', false),
            _buildCategoryChip('Biceps', false),
            _buildCategoryChip('Chest', false),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {},
      selectedColor: Colors.orange,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Widget _buildExerciseList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExerciseCard(
          'Full Body Warm Up',
          '20 Exercises',
          '22 Min',
          'assets/squats.png', // Replace with actual image URL
        ),
        _buildExerciseCard(
          'Strength Exercise',
          '12 Exercises',
          '14 Min',
          'assets/halteres.png', // Replace with actual image URL
        ),
        _buildExerciseCard(
          'Both Side Plank',
          '15 Exercises',
          '18 Min',
          'assets/pompes.png', // Replace with actual image URL
        ),
        _buildExerciseCard(
          'Abs Workout',
          '16 Exercises',
          '18 Min',
          'assets/abs.png', // Replace with actual image URL
        ),
        _buildExerciseCard(
          'Torso and Trap Workout',
          '8 Exercises',
          '10 Min',
          'assets/pilates.png', // Replace with actual image URL
        ),
        _buildExerciseCard(
          'Lower Back Exercise',
          '14 Exercises',
          '18 Min',
          'assets/aviron.png', // Replace with actual image URL
        ),
      ],
    );
  }

  Widget _buildExerciseCard(
      String title, String exercises, String duration, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          height: 50,
          width: 50,
        ),
        title: Text(title),
        subtitle: Text('$exercises • $duration'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
