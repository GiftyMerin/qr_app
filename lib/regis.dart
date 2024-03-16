import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController rollcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void Registeruser() async {
    print(namecontroller.text);
    print(rollcontroller.text);
    print(emailcontroller.text);
    print(passwordcontroller.text);

    Uri uri= Uri.parse('https://scnner-web.onrender.com/api/register');
    var response =await http.post(uri,
        headers:<String,String>{
      'Content-Type':'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'name':namecontroller.text,
      'rollno':rollcontroller.text,
    'email': emailcontroller.text,
    'password':passwordcontroller.text,
    }));
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    }
    else{
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text(response.body)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: namecontroller,

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
                controller: rollcontroller,
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
              TextField( controller: emailcontroller,
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
              TextField(controller: passwordcontroller,
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
                onPressed: () {
                  Registeruser();
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
