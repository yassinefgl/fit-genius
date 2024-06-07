import 'package:flutter/material.dart';

void main() {
  runApp(MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MealPlannerPage(),
    );
  }
}

class MealPlannerPage extends StatefulWidget {
  @override
  _MealPlannerPageState createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.lightBlueAccent).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: _colorAnimation.value,
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Weekly Meal Planner',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Icon(
                    Icons.restaurant,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue[100]!),
                headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                dataRowColor: MaterialStateColor.resolveWith((states) => Colors.blue[50]!),
                columns: _getTableColumns(),
                rows: _getTableRows(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _getTableColumns() {
    return meals[0].map<DataColumn>((item) => DataColumn(label: Text(item))).toList();
  }

  List<DataRow> _getTableRows() {
    return meals.skip(1).map<DataRow>((row) {
      return DataRow(
        cells: row.map<DataCell>((item) => DataCell(Text(item))).toList(),
      );
    }).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

List<List<String>> meals = [
  ['Day', 'Breakfast 1', 'Breakfast 2', 'Breakfast 3', 'Lunch 1', 'Lunch 2', 'Lunch 3', 'Dinner 1', 'Dinner 2', 'Dinner 3'],
  ['Monday', 'Eggs and Toast', 'Oatmeal', 'Pancakes', 'Grilled Chicken Salad', 'Turkey Sandwich', 'Quinoa Salad', 'Spaghetti Bolognese', 'Vegetable Stir Fry', 'Chicken Curry'],
  ['Tuesday', 'Smoothie', 'Yogurt and Fruit', 'French Toast', 'Tuna Wrap', 'Bean Burritos', 'Caprese Sandwich', 'Vegetable Stir Fry', 'Shrimp Scampi', 'Vegetable Lasagna'],
  ['Wednesday', 'Omelette', 'Bagels with Cream Cheese', 'Pancakes', 'Caesar Salad', 'Chicken Alfredo', 'Tuna Salad', 'Stir-Fried Tofu', 'Roast Chicken with Veggies', 'Vegetarian Stir Fry'],
  ['Thursday', 'Oatmeal', 'Fruit Salad', 'Smoothie', 'Grilled Cheese Sandwich', 'Chicken Salad', 'Falafel Wrap', 'Spaghetti Aglio e Olio', 'Beef Stir Fry', 'Veggie Pizza'],
  ['Friday', 'French Toast', 'Bagels with Cream Cheese', 'Smoothie', 'Turkey Sandwich', 'Steak with Mashed Potatoes', 'Caprese Salad', 'Tofu Stir Fry', 'Salmon with Roasted Vegetables', 'Vegetable Lasagna'],
  ['Saturday', 'Eggs and Toast', 'Omelette', 'Pancakes', 'Tuna Wrap', 'Shrimp Scampi', 'Quinoa Salad', 'Stir-Fried Tofu', 'Chicken Fajitas', 'Vegetable Lasagna'],
  ['Sunday', 'Smoothie', 'Yogurt and Fruit', 'French Toast', 'Grilled Chicken Salad', 'Tuna Salad Sandwich', 'Vegetarian Stir Fry', 'Spaghetti Bolognese', 'Roast Chicken with Veggies', 'Vegetable Pizza'],
];
