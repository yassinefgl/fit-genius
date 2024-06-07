import 'package:flutter/material.dart';
import 'TipsPage.dart'; // Importez la classe TipsPage
import 'MealPlannerDiab.dart'; // Importez la classe MealPlannerDiab
import 'VeganRecipesPage.dart'; // Importez la classe VeganRecipesPage
import 'MealPlanPage.dart'; // Importez la classe MealPlanPage

class KetoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/health_image.jpg',
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'KETO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Live it Healthy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildIconText(
                        icon: Icons.lightbulb,
                        text: 'Conseiles',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DiabetesTipsPage()),
                          );
                        },
                      ),
                      _buildIconText(
                        icon: Icons.food_bank,
                        text: 'Diabetic Meal Planner',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MealPlanner()),
                          );
                        },
                      ),
                      _buildIconText(
                        icon: Icons.restaurant_menu,
                        text: 'Vegan Recipes',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VeganRecipesPage()),
                          );
                        },
                      ),
                      _buildIconText(
                        icon: Icons.calendar_today,
                        text: 'Meal Plan',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MealPlanPage()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconText({required IconData icon, required String text, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 36),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
