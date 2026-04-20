import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  final name, mobile;

  ResumePage(this.name, this.mobile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resume")),
      body: Column(
        children: [
          Text("Name: $name", style: TextStyle(fontSize: 20)),
          Text("Mobile: $mobile"),
        ],
      ),
    );
  }
}