import 'package:flutter/material.dart';

class VeganRecipesPage extends StatelessWidget {
  final List<Map<String, String>> veganRecipes = [
    {
      'title': 'Vegan Pancakes',
      'description': 'Fluffy vegan pancakes with maple syrup.',
    },
    {
      'title': 'Quinoa Salad',
      'description': 'A healthy quinoa salad with fresh vegetables.',
    },
    {
      'title': 'Vegan Tacos',
      'description': 'Tasty vegan tacos with beans and avocado.',
    },
    {
      'title': 'Chickpea Curry',
      'description': 'Spicy chickpea curry with coconut milk.',
    },
    {
      'title': 'Vegan Brownies',
      'description': 'Delicious vegan brownies with chocolate chips.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegan Recipes', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: veganRecipes.length,
        itemBuilder: (context, index) {
          final recipe = veganRecipes[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: 40,
                    color: Colors.green,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          recipe['description']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VeganRecipesPage(),
  ));
}
