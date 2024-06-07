import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final TextEditingController currentWeightController = TextEditingController();
  final TextEditingController targetWeightController = TextEditingController();
  double currentWeight = 0.0;
  double targetWeight = 0.0;
  double change = 0.0;
  double remaining = 0.0;

  void _updateProgress() {
    setState(() {
      try {
        currentWeight = double.parse(currentWeightController.text);
        targetWeight = double.parse(targetWeightController.text);
        change = currentWeight - targetWeight;
        remaining = (change > 0) ? change : -change;
      } catch (e) {
        // Handle error if the input is not a valid number
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter valid numbers')),
        );
      }
    });
  }

  Future<void> _downloadPageAsPDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'Progress Tracking',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.orange,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'AI 3arndas',
                style: pw.TextStyle(
                  fontSize: 20,
                  color: PdfColors.orange,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Current Weight: $currentWeight KG'),
              pw.Text('Target Weight: $targetWeight KG'),
              pw.Text('Change: ${change.toStringAsFixed(1)} KG'),
              pw.Text('Remaining: ${remaining.toStringAsFixed(1)} KG'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/progress.pdf");
    await file.writeAsBytes(await pdf.save());
    
    OpenFile.open(file.path);
  }

  List<FlSpot> _getSpots() {
    // Adjust the spots based on weight change.
    List<FlSpot> spots = [];
    double weight = currentWeight;
    for (int i = 0; i <= 5; i++) {
      spots.add(FlSpot(i.toDouble(), weight));
      weight -= (change / 5); // Simulating the weight change over 5 periods.
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Tracking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Progress Tracking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/user_image.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'AI 3arndas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: currentWeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Current Weight (KG)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: targetWeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Target Weight (KG)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProgress,
                child: Text('Update Progress'),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(showTitles: true),
                      bottomTitles: SideTitles(showTitles: true),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _getSpots(),
                        isCurved: true,
                        colors: [Colors.orange],
                        barWidth: 3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildInfoCard('Current', '$currentWeight KG', Colors.white),
                  _buildInfoCard('Target', '$targetWeight KG', Colors.orange.shade100),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildInfoCard('Change', '${change.toStringAsFixed(1)} KG', Colors.blue.shade100),
                  _buildInfoCard('Remaining', '${remaining.toStringAsFixed(1)} KG', Colors.blue.shade100),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadPageAsPDF,
                child: Text('Download as PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProgressPage(),
  ));
}
