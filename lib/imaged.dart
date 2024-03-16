import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_app/profile.dart';
class Imageee extends StatefulWidget {
  const Imageee({super.key});

  @override
  State<Imageee> createState() => _ImageeeState();
}

class _ImageeeState extends State<Imageee> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mobile Scanner')),
        body: Column(
          children: [
            MobileScanner(
              // fit: BoxFit.contain,
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.normal,
                facing: CameraFacing.front,
                torchEnabled: true,
              ),
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Dp()));
            } ,
                child: const Text('navigate',style: TextStyle(fontSize: 14.0),
            ),
            ),

          ],
        ),
      ),
    );;
  }
}

