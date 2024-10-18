import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneration extends StatefulWidget {
  const QrGeneration({super.key});

  @override
  State<QrGeneration> createState() => _QrGenerationState();
}

class _QrGenerationState extends State<QrGeneration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Student QR Code'),
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
                      version: QrVersions.auto,
                      gapless: false,
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(80, 80),
                      ),
                      errorCorrectionLevel: QrErrorCorrectLevel.M),
                ),
              ),
            )));
  }
}
