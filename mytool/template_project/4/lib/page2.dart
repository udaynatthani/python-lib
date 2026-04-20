import 'package:flutter/material.dart';
import 'preview.dart';

class Page2 extends StatelessWidget {
  final String name, mobile, branch, gender;
  final Map skills;
  final double cgpa;

  Page2(this.name, this.mobile, this.branch, this.gender, this.skills, this.cgpa);

  @override
  Widget build(BuildContext context) {
    TextEditingController ssc = TextEditingController();
    TextEditingController hsc = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: Column(
        children: [
          TextField(controller: ssc, decoration: InputDecoration(labelText: "SSC Marks")),
          TextField(controller: hsc, decoration: InputDecoration(labelText: "HSC Marks")),

          Row(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Previous"),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PreviewPage(
                        name, mobile, branch, gender, skills, cgpa,
                        ssc.text, hsc.text,
                      ),
                    ),
                  );
                },
                child: Text("Next"),
              ),
            ],
          )
        ],
      ),
    );
  }
}