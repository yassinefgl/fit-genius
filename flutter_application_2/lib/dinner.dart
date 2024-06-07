import 'package:flutter/material.dart';

class DinnerMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dinner on you Tonight',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.purple[50],
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(),
              MenuItem(
                title: 'Rice',
                icon: Icons.rice_bowl,
                description: 'Rice is great if you want to eat a 100 of something',
              ),
              MenuItem(
                title: 'Salad',
                icon: Icons.eco,
                description: 'Eat clean and green',
              ),
              MenuItem(
                title: 'Quinoa',
                icon: Icons.grain,
                description: 'Everything is better with Quinoa',
              ),
              MenuItem(
                title: 'Soup',
                icon: Icons.soup_kitchen,
                description: 'Good soup is one of the prime ingredients of a good living',
              ),
              MenuItem(
                title: 'Pasta',
                icon: Icons.local_pizza,
                description: 'Life is a combination between magic and pasta',
              ),
              MenuItem(
                title: 'Noodles',
                icon: Icons.paste_sharp,
                description: 'Noodles are not only amusing but delicious',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Dinner on you Tonight',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 10),
          Icon(
            Icons.dinner_dining,
            size: 50,
            color: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  MenuItem({required this.title, required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  icon,
                  size: 50,
                  color: Colors.purpleAccent,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.purpleAccent),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DinnerMenuScreen(),
  ));
}
