import 'package:flutter/material.dart';
import 'dart:async';

class WorkoutPage extends StatelessWidget {
  final List<String> categories = [
    'All',
    'Warm Up',
    'Yoga',
    'Biceps',
    'Chest',
  ];

  final List<Map<String, dynamic>> warmUpWorkouts = [
    {
      'title': 'Full Body Warm Up',
      'subtitle': '20 Exercises • 22 Min',
      'image': '/Users/yassineelfoughali/Desktop/pfa/flutter_application_2/assets/squats.png', // Replace with your image path
      'time': 22,
    },
    {
      'title': 'Strength Exercise',
      'subtitle': '12 Exercises • 14 Min',
      'image': '/Users/yassineelfoughali/Desktop/pfa/flutter_application_2/assets/halteres.png',
      'time': 14,
    },
    {
      'title': 'Both Side Plank',
      'subtitle': '15 Exercises • 18 Min',
      'image': '/Users/yassineelfoughali/Desktop/pfa/flutter_application_2/assets/pompes.png',
      'time': 18,
    },
  ];

  final List<Map<String, dynamic>> workouts = [
    {
      'title': 'Abs Workout',
      'subtitle': '16 Exercises • 18 Min',
      'image': '/Users/yassineelfoughali/Desktop/pfa/flutter_application_2/assets/abs.png',
      'time': 18,
    },
    {
      'title': 'Torso and Trap Workout',
      'subtitle': '8 Exercises • 10 Min',
      'image': '/Users/yassineelfoughali/Desktop/pfa/flutter_application_2/assets/pilates.png',
      'time': 10,
    },
    {
      'title': 'Lower Back Exercise',
      'subtitle': '14 Exercises • 18 Min',
      'image': '/Users/yassineelfoughali/Desktop/pfa/flutter_application_2/assets/aviron.png',
      'time': 18,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Fit Genius', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8.0,
                children: categories.map((category) {
                  return Chip(
                    label: Text(category),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Warm Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: warmUpWorkouts.map((workout) {
                  return WorkoutCard(
                    title: workout['title'],
                    subtitle: workout['subtitle'],
                    image: workout['image'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetailPage(
                            title: workout['title'],
                            subtitle: workout['subtitle'],
                            image: workout['image'],
                            time: workout['time'],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workout',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('See All'),
                    ),
                  ],
                ),
              ),
              Column(
                children: workouts.map((workout) {
                  return WorkoutCard(
                    title: workout['title'],
                    subtitle: workout['subtitle'],
                    image: workout['image'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetailPage(
                            title: workout['title'],
                            subtitle: workout['subtitle'],
                            image: workout['image'],
                            time: workout['time'],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  WorkoutCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

class WorkoutDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int time;

  WorkoutDetailPage({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 20),
            Text(
              subtitle,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Exercises',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Jumping Jacks\n• Arm Circles\n• Leg Swings\n• Bodyweight Squats\n• Hip Circles\n• Torso Twists',
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExercisePage(
                      title: title,
                      image: image,
                      time: time,
                    ),
                  ),
                );
              },
              child: Text('Start Exercise'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExercisePage extends StatefulWidget {
  final String title;
  final String image;
  final int time;

  ExercisePage({
    required this.title,
    required this.image,
    required this.time,
  });

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  Timer? _timer;
  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.time * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.image),
            SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _formattedTime,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _remainingTime = widget.time * 60;
                    });
                  },
                  child: Text('Restart'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_timer?.isActive ?? false) {
                      _timer?.cancel();
                    } else {
                      _startTimer();
                    }
                    setState(() {});
                  },
                  child: Text(_timer?.isActive ?? false ? 'Pause' : 'Resume'),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}
