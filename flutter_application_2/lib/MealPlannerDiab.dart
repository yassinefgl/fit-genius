import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_page.dart';

class MealPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetic Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DiabeticMealPlannerPage(),
    );
  }
}

class DiabeticMealPlannerPage extends StatefulWidget {
  @override
  _DiabeticMealPlannerPageState createState() => _DiabeticMealPlannerPageState();
}

class _DiabeticMealPlannerPageState extends State<DiabeticMealPlannerPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetic Meal Planner'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.red[200]!),
            headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            dataRowColor: MaterialStateColor.resolveWith((states) => Colors.red[100]!),
            columns: _getTableColumns(),
            rows: _getTableRows(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.red,
      ),
    );
  }

  List<DataColumn> _getTableColumns() {
    return meals[0].map<DataColumn>((item) => DataColumn(label: Text(item))).toList();
  }

  List<DataRow> _getTableRows() {
    return meals.skip(1).map<DataRow>((row) {
      return DataRow(
        cells: row.map<DataCell>((item) {
          return DataCell(
            Row(
              children: [
                Icon(
                  Icons.restaurant_menu,
                  color: Colors.red,
                ),
                SizedBox(width: 4),
                Text(item),
              ],
            ),
            onTap: () {
              _startAnimation();
            },
          );
        }).toList(),
      );
    }).toList();
  }

  void _startAnimation() {
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

List<List<String>> meals = [
  ['Day', 'Breakfast', 'Lunch', 'Dinner'],
  ['Monday', 'Scrambled Eggs with Spinach', 'Grilled Chicken Salad', 'Baked Salmon with Steamed Vegetables'],
  ['Tuesday', 'Greek Yogurt with Berries', 'Quinoa and Black Bean Salad', 'Turkey and Vegetable Stir Fry'],
  ['Wednesday', 'Oatmeal with Almonds and Berries', 'Grilled Vegetable Wrap', 'Cauliflower Rice with Tofu'],
  ['Thursday', 'Whole Grain Toast with Avocado', 'Chickpea and Spinach Curry', 'Grilled Fish with Asparagus'],
  ['Friday', 'Smoothie with Spinach and Berries', 'Zucchini Noodles with Pesto', 'Chicken and Vegetable Skewers'],
  ['Saturday', 'Egg Muffins with Vegetables', 'Tuna Salad Lettuce Wraps', 'Stuffed Bell Peppers with Lean Ground Beef'],
  ['Sunday', 'Whole Grain Pancakes with Sugar-Free Syrup', 'Mediterranean Salad with Feta', 'Roast Chicken with Brussels Sprouts'],
];