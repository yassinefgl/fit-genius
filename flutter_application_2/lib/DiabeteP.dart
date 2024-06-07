import 'package:flutter/material.dart';
import 'package:flutter_application_2/bmi.dart';
import 'dart:math';

import 'package:flutter_application_2/main.dart';

void main() {
  runApp(DiabetesPredictorApp());
}

class DiabetesPredictorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes Predictor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiabetesPredictorPage(),
    );
  }
}

class DiabetesPredictorPage extends StatefulWidget {
  @override
  _DiabetesPredictorPageState createState() => _DiabetesPredictorPageState();
}

class _DiabetesPredictorPageState extends State<DiabetesPredictorPage> {
  TextEditingController glucoseController = TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController skinThicknessController = TextEditingController();
  TextEditingController insulinLevelController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController pregnanciesController = TextEditingController();
  TextEditingController pedigreeController = TextEditingController();

  double bmi = 0.0;
  bool hasDiabetes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Predictor'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Glucose', glucoseController),
            _buildTextField('Blood Pressure', bloodPressureController),
            _buildTextField('Skin Thickness', skinThicknessController),
            _buildTextField('Insulin Level', insulinLevelController),
            _buildTextField('BMI', bmiController, hasButton: true),
            _buildTextField('Pregnancies', pregnanciesController),
            _buildTextField('Diabetes Pedigree', pedigreeController),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _validateInputs,
              child: Text('Validate'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Diabetes Status:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              hasDiabetes ? 'Diabetes Detected' : 'No Diabetes Detected',
              style: TextStyle(fontSize: 18.0, color: hasDiabetes ? Colors.red : Colors.green),
            ),
            SizedBox(height: 20.0),
            // Ajouter le bouton "Retour au Sign In"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text('Retour au Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool hasButton = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffix: hasButton
              ? IconButton(
                  icon: Icon(Icons.calculate),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                )
              : null,
        ),
      ),
    );
  }

  void _validateInputs() {
    // Convertir les valeurs des TextEditingController en double
    double glucose = double.tryParse(glucoseController.text) ?? 0.0;
    double bloodPressure = double.tryParse(bloodPressureController.text) ?? 0.0;
    double skinThickness = double.tryParse(skinThicknessController.text) ?? 0.0;
    double insulinLevel = double.tryParse(insulinLevelController.text) ?? 0.0;
    double bmi = double.tryParse(bmiController.text) ?? 0.0;
    double pregnancies = double.tryParse(pregnanciesController.text) ?? 0.0;
    double pedigree = double.tryParse(pedigreeController.text) ?? 0.0;

    setState(() {
      // Vérifier les conditions pour le statut du diabète
      if (glucose > 100 || bmi > 30) {
        hasDiabetes = true;
      } else {
        hasDiabetes = false;
      }
    });

    // Print the values for demonstration
    print('Glucose: $glucose');
    print('Blood Pressure: $bloodPressure');
    print('Skin Thickness: $skinThickness');
    print('Insulin Level: $insulinLevel');
    print('BMI: $bmi');
    print('Pregnancies: $pregnancies');
    print('Diabetes Pedigree: $pedigree');
    print('Diabetes Status: ${hasDiabetes ? 'Diabetes Detected' : 'No Diabetes Detected'}');
  }
}

// Placeholder pour WelcomePage, remplacez par votre page réelle



// Définir la page SignIn

