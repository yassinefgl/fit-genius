import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LunchScreen(),
    );
  }
}

class LunchScreen extends StatelessWidget {
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
          'Lunch Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'LUNCH TIME',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Search...',
                  suffixIcon: Icon(Icons.search, color: Colors.orangeAccent),
                ),
              ),
            ),
            SectionTitle(title: 'Meat Treats'),
            HorizontalList(items: [
              CategoryItem(title: 'Seafood', icon: Icons.set_meal),
              CategoryItem(title: 'Chicken', icon: Icons.dining),
              CategoryItem(title: 'Beef', icon: Icons.fastfood),
              CategoryItem(title: 'Turkey', icon: Icons.food_bank),
              CategoryItem(title: 'Fish', icon: Icons.dinner_dining),
            ]),
            BannerSection(),
            SectionTitle(title: 'Special Occasion'),
            HorizontalList(items: [
              CategoryItem(title: 'Summer Food', icon: Icons.wb_sunny),
              CategoryItem(title: 'Weekend Night', icon: Icons.nights_stay),
              CategoryItem(title: 'Party Time', icon: Icons.celebration),
              CategoryItem(title: 'Special Collection', icon: Icons.star),
            ]),
            SectionTitle(title: 'Sugar Free'),
            HorizontalList(items: [
              CategoryItem(title: 'Ice Cream', icon: Icons.icecream),
              CategoryItem(title: 'Cake', icon: Icons.cake),
              CategoryItem(title: 'Appetizing Dessert', icon: Icons.emoji_food_beverage),
              CategoryItem(title: 'Special Collection', icon: Icons.star_outline),
            ]),
            SectionTitle(title: 'Delight Meal'),
            HorizontalList(items: [
              CategoryItem(title: 'Soup', icon: Icons.soup_kitchen),
              CategoryItem(title: 'Pasta', icon: Icons.local_pizza),
              CategoryItem(title: 'Stir Fry', icon: Icons.dining_outlined),
              CategoryItem(title: 'Fresh Dishes', icon: Icons.restaurant),
            ]),
            SectionTitle(title: 'Immunity Booster'),
            HorizontalList(items: [
              CategoryItem(title: 'Detox', icon: Icons.local_drink),
              CategoryItem(title: 'Salad', icon: Icons.lunch_dining),
              CategoryItem(title: 'Vegan', icon: Icons.eco),
            ]),
            BannerSection(),
            SectionTitle(title: 'Diabetic Premium'),
            HorizontalList(items: [
              CategoryItem(title: 'Find your meal', icon: Icons.search),
              CategoryItem(title: 'Collect and Print', icon: Icons.print),
            ]),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  final List<CategoryItem> items;

  HorizontalList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(items[index].icon, size: 50, color: Colors.orangeAccent),
                ),
                SizedBox(height: 8),
                Text(
                  items[index].title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.orangeAccent),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;

  CategoryItem({required this.title, required this.icon});
}

class BannerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 100,
        color: Colors.orange.shade100,
        child: Center(
          child: Text(
            'Special Offers!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
          ),
        ),
      ),
    );
  }
}
