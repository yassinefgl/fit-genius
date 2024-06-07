import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to FitGenius!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'These terms and conditions outline the rules and regulations for the use of FitGenius\'s Website, located at www.fitgenius.com.',
              ),
              SizedBox(height: 10),
              Text(
                'By accessing this website we assume you accept these terms and conditions. Do not continue to use FitGenius if you do not agree to take all of the terms and conditions stated on this page.',
              ),
              SizedBox(height: 10),
              Text(
                'License',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Unless otherwise stated, FitGenius and/or its licensors own the intellectual property rights for all material on FitGenius. All intellectual property rights are reserved. You may access this from FitGenius for your own personal use subjected to restrictions set in these terms and conditions.',
              ),
              SizedBox(height: 10),
              Text(
                'You must not:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '• Republish material from FitGenius\n• Sell, rent or sub-license material from FitGenius\n• Reproduce, duplicate or copy material from FitGenius\n• Redistribute content from FitGenius',
              ),
              SizedBox(height: 10),
              Text(
                'This Agreement shall begin on the date hereof.',
              ),
              // Ajoutez plus de sections comme ci-dessus pour compléter les termes et conditions
              SizedBox(height: 20),
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We value your privacy and the protection of your personal data. Please refer to our Privacy Policy for details on how we collect, use, and protect your information.',
              ),
              SizedBox(height: 20),
              Text(
                'Changes to Terms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We may update these terms and conditions from time to time. Any changes will be posted on this page, so please review it periodically.',
              ),
              // Vous pouvez ajouter plus de sections si nécessaire
            ],
          ),
        ),
      ),
    );
  }
}
