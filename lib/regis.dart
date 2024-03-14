import 'package:flutter/material.dart';

import 'login.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              "Registration",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Enter Your Name",
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsetsDirectional.all(19.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Enter Your Roll No.",
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsetsDirectional.all(19.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsetsDirectional.all(19.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
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
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 2)),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(19.0),
                ),
                onPressed: () {},
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}