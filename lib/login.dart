import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:qr_app/qrp.dart';
import 'package:qr_app/regis.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

final rollcontroller = TextEditingController();

final passwordcontroller = TextEditingController();

bool loading = false;

Future<void> login(BuildContext context) async {
  print(rollcontroller.text);
  print(passwordcontroller.text);

  Uri url = Uri.parse('https://scnner-web.onrender.com/api/login');

  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; character=UTF-8'
      },
      body: jsonEncode({
        'rollno': rollcontroller.text,
        'password': passwordcontroller.text
      }));

  print(response.body);

  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrScreen()),
    );
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(data["message"])));
  }
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextField(
                controller: rollcontroller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintText: "Enter Your Roll No",
                    hintStyle: TextStyle(color: Colors.white70),
                    contentPadding: EdgeInsetsDirectional.all(19.0)),
              ),
              SizedBox(height: 25),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Enter Your Password",
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsetsDirectional.all(19.0),
                ),
              ),
              SizedBox(height: 30),
              TextButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 2)),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(19.0),
                ),
                onPressed: () {
                  login(context);
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(color: Colors.white70),
                  ))
            ],
          )),
    );
  }
}