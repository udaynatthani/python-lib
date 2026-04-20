import 'package:flutter/material.dart';

void main() {
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume App',
      home: ResumePage(),
    );
  }
}

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Resume"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Profile Section
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: Text(
                "Uday Natthani",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Center(
              child: Text(
                "Engineering Student",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            Divider(height: 30, thickness: 2),

            // Personal Details
            sectionTitle("Personal Details"),
            detailRow("Email", "uday@example.com"),
            detailRow("Phone", "+91 9876543210"),
            detailRow("Location", "Mumbai, India"),

            Divider(),

            // Qualification
            sectionTitle("Qualification"),
            bulletText("B.E. in Computer Engineering"),
            bulletText("XYZ College"),
            bulletText("CGPA: 8.5"),

            Divider(),

            // Technical Skills
            sectionTitle("Technical Skills"),
            bulletText("C++"),
            bulletText("Java"),
            bulletText("Flutter & Dart"),
            bulletText("React JS"),
            bulletText("MySQL"),

          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}