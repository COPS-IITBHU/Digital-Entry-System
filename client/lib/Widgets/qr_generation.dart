import 'package:client/Models/student.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneration extends StatefulWidget {
  Student student;
  QrGeneration({super.key, required this.student});

  @override
  State<QrGeneration> createState() => _QrGenerationState();
}

class _QrGenerationState extends State<QrGeneration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student QR Code'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SizedBox(
          height: 320,
          width: 320,
          child: SizedBox(
            child: CustomPaint(
              painter: QrPainter(
                  data: 'https://flutter.dev',
                  //TODO: Replace the data with the student's link
                  version: QrVersions.auto,
                  gapless: false,
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                  errorCorrectionLevel: QrErrorCorrectLevel.M),
            ),
          ),
        ),
      ),
    );
  }
}
