import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController branch = TextEditingController();

  double cgpa = 5.0;
  String gender = "Male";
  Map<String, bool> skills = {
    "C++": false,
    "Java": false,
    "Flutter": false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: SingleChildScrollView(
        child: Column(
          children: [

            TextField(controller: name, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: mobile, decoration: InputDecoration(labelText: "Mobile")),
            TextField(controller: branch, decoration: InputDecoration(labelText: "Branch")),

            DropdownButton(
              value: gender,
              items: ["Male", "Female"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => gender = val!),
            ),

            Text("Skills"),
            ...skills.keys.map((key) {
              return CheckboxListTile(
                title: Text(key),
                value: skills[key],
                onChanged: (val) {
                  setState(() => skills[key] = val!);
                },
              );
            }),

            Text("CGPA: $cgpa"),
            Slider(
              value: cgpa,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (val) => setState(() => cgpa = val),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Page2(
                      name.text,
                      mobile.text,
                      branch.text,
                      gender,
                      skills,
                      cgpa,
                    ),
                  ),
                );
              },
              child: Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}