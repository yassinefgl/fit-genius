import 'package:flutter/material.dart';
import 'package:flutter_application_2/forgot_password_page.dart';
import 'package:flutter_application_2/reset_password_page.dart';
import 'package:flutter_application_2/terms.dart';
import 'logout.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          Icon(Icons.edit, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yassine',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text('@Elfoughali379', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.black),
                ],
              ),
              SizedBox(height: 24),
              Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Weight', style: TextStyle(color: Colors.white)),
                          Text('89 Kg', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Height', style: TextStyle(color: Colors.white)),
                          Text('169 Cm', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Todo Today', style: TextStyle(color: Colors.white)),
                          Text('45 %', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              buildListTile(context, Icons.lock, 'Change Password', ResetPasswordPage()),
              buildListTile(context, Icons.lock_open, 'Forgot Password', ForgotPasswordPage()),
              buildListTile(context, Icons.security, 'Security', null),
              Divider(),
              buildListTile(context, Icons.language, 'Language', null),
              buildListTile(context, Icons.delete, 'Clear Cache', null, trailing: Text('88 MB')),
              Divider(),
              buildListTile(context, Icons.policy, 'Legal and Policies', TermsAndConditionsPage()),
              buildListTile(context, Icons.help, 'Help & Support', null),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: false,
                onChanged: (bool value) {},
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _showLogoutDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, IconData icon, String title, Widget? page, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogoutPage()),
                );
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}