// ignore_for_file: camel_case_types, library_private_types_in_public_api, avoid_print, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_usb_printer/flutter_usb_printer.dart';

class Screen_USB extends StatefulWidget {
  const Screen_USB({super.key});

  @override
  _Screen_USBState createState() => _Screen_USBState();
}

class _Screen_USBState extends State<Screen_USB> {
  List<Map<String, dynamic>> devices = [];
  FlutterUsbPrinter flutterUsbPrinter = FlutterUsbPrinter();
  bool connected = false;

  @override
  initState() {
    super.initState();
    _getDevicelist();
  }

  _getDevicelist() async {
    List<Map<String, dynamic>> results = [];
    results = await FlutterUsbPrinter.getUSBDeviceList();

    print(" length: ${results.length}");
    setState(() {
      devices = results;
    });
  }

  _connect(int vendorId, int productId) async {
    bool? returned = false;
    try {
      returned = await flutterUsbPrinter.connect(vendorId, productId);
    } on PlatformException {
      //response = 'Failed to get platform version.';
    }
    if (returned!) {
      setState(() {
        connected = true;
      });
    }
  }

  _print() async {
    try {
      var data = Uint8List.fromList(utf8.encode("Hello world"));

      await flutterUsbPrinter.printText('Testing 111 printer');
      await flutterUsbPrinter.write(data);

      // await flutterUsbPrinter.printRawText('ddddddddd');

      // await flutterUsbPrinter.close();

      //
    } on PlatformException {
      //response = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USB PRINTER'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => _getDevicelist()),
          connected == true
              ? IconButton(
                  icon: const Icon(Icons.print),
                  onPressed: () {
                    _print();
                    _getDevicelist();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Screen_USB()),
                    );
                  })
              : Container(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: 300,
            child: devices.isNotEmpty
                ? ListView(
                    scrollDirection: Axis.vertical,
                    children: _buildList(devices),
                  )
                : null,
          )
        ],
      ),
    );
  }

  List<Widget> _buildList(List<Map<String, dynamic>> devices) {
    return devices
        .map((device) => ListTile(
              onTap: () {
                _connect(int.parse(device['vendorId']),
                    int.parse(device['productId']));
              },
              leading: const Icon(Icons.usb),
              title: Text(device['manufacturer'] + " " + device['productName']),
              subtitle: Text(device['vendorId'] + " " + device['productId']),
            ))
        .toList();
  }
}
