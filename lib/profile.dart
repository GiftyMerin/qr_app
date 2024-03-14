import 'package:flutter/material.dart';
class Dp extends StatefulWidget {
  const Dp({super.key});

  @override
  State<Dp> createState() => _DpState();
}

class _DpState extends State<Dp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top:30),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white)
                ),
                child: Image.network('https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2082370165.1710374400&semt=ais'),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
