import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodiko/screens/screen_admin_deliverpage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AdminScan extends StatefulWidget {
  const AdminScan({Key? key}) : super(key: key);

  @override
  State<AdminScan> createState() => _AdminScanState();
}

class _AdminScanState extends State<AdminScan> {
  Color main_clr = Color.fromARGB(255, 82, 119, 187);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: main_clr,
                borderLength: 20,
                borderWidth: 10,
                borderRadius: 10,
                cutOutSize: 200),
          ),
          Positioned(
              bottom: 50,
              child: Text(
                barcode != null ? '${barcode!.code}' : 'scanning..',
                style: TextStyle(
                    fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),
              ))
        ]),
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    print("=------>" + barcode.toString());
    setState(() {
      print('ONQRview....');
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) {
      if (this.mounted) {
        setState(() {
          //print(barcode!.code);
          this.barcode = barcode;

          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext bc) => AdminDeliver(
                    oid: barcode.code,
                  )));
        });
      }
    });
  }
}
