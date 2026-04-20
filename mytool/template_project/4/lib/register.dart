import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final user = TextEditingController();
  final pass = TextEditingController();
  final confirm = TextEditingController();

  String error = "";

  void validate() {
    if (pass.text != confirm.text) {
      setState(() => error = "Passwords do not match");
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: user, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: pass, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            TextField(controller: confirm, obscureText: true, decoration: InputDecoration(labelText: "Confirm Password")),

            Text(error, style: TextStyle(color: Colors.red)),

            ElevatedButton(onPressed: validate, child: Text("Register")),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}