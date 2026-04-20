import 'package:flutter/material.dart';
import 'resume.dart';

class PreviewPage extends StatelessWidget {
  final name, mobile, branch, gender, skills, cgpa, ssc, hsc;

  PreviewPage(this.name, this.mobile, this.branch, this.gender, this.skills, this.cgpa, this.ssc, this.hsc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview")),
      body: Column(
        children: [
          Text("Name: $name"),
          Text("Mobile: $mobile"),
          Text("Branch: $branch"),
          Text("Gender: $gender"),
          Text("CGPA: $cgpa"),
          Text("SSC: $ssc"),
          Text("HSC: $hsc"),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ResumePage(name, mobile)));
            },
            child: Text("Generate Resume"),
          )
        ],
      ),
    );
  }
}