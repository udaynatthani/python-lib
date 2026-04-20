import 'package:flutter/material.dart';
import 'register.dart';
import 'page1.dart';

class LoginPage extends StatelessWidget {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: userController, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: passController, obscureText: true, decoration: InputDecoration(labelText: "Password")),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Page1()));
              },
              child: Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
              },
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}