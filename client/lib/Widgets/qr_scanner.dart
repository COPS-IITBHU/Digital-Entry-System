import 'package:client/Models/student.dart';
import 'package:client/Screens/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  late Student student;
  String qrResult = 'Not Yet Scanned';
  Future<void> scanQrCode() async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) {
        return;
      }
      setState(() {
        qrResult = result.toString();
        //TODO: Fetch the student and initialize the student object
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfilePage(student: student)));
    } on PlatformException {
      qrResult = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Scan a QR Code',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(qrResult),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanQrCode,
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
