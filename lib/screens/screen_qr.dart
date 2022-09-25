import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRpage extends StatelessWidget {
  final id, status;
  QRpage({Key? key, required String this.id, required String this.status})
      : super(key: key);
  Color main_clr = Color.fromARGB(255, 82, 119, 187);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 40),
                child: Text(
                  'Order Details',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Text('ORDER ' + status),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              status == "DELIVERED" ? 'THIS ORDER ALREADY DELIVERED!' : '',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 25,
              left: 25,
            ),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 233, 233, 233)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImage(
                      foregroundColor: main_clr,
                      data: id,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('Show this QR at canteen')
        ]),
      ),
    );
  }
}
