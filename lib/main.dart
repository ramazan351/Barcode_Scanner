import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _takeBarCode, _setBarCode = "";

  Future getBarCode() async {
    _takeBarCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Kapat", true, ScanMode.BARCODE);
    setState(() {
      _setBarCode = _takeBarCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Barkod Ve Qr Kod okuyucu"),),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                "Borkod Kodu:",
                style: TextStyle(color: Colors.black),
              ),Text(_setBarCode,style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getBarCode,
          child: Icon(Icons.settings_overscan_sharp),
        ),
      ),
    );
  }
}
