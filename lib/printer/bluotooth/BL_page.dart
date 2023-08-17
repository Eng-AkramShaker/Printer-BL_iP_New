// ignore_for_file: avoid_print, non_constant_identifier_names, unused_element, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_printer/flutter_bluetooth_printer.dart';

class BL_Page extends StatefulWidget {
  const BL_Page({Key? key}) : super(key: key);

  @override
  State<BL_Page> createState() => _BL_PageState();
}

class _BL_PageState extends State<BL_Page> {
  ReceiptController? controller;
  String? address;

  bool show_Widget = false;

  timer_printer() async {
    setState(() {
      show_Widget = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      show_Widget = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt Page'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final selected =
                      await FlutterBluetoothPrinter.selectDevice(context);
                  if (selected != null) {
                    setState(() {
                      address = selected.address;
                      print(selected.type);
                      print(address);
                    });
                  }
                },
                child: const Text('بحث'),
              ),

              Expanded(
                child: Receipt(
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 120,
                          child: Image.asset(
                            'images/logo2.jpeg',
                            scale: 0.6,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            "إختبار الطابعة",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 4, 19, 150)),
                          ),
                        ),
                        const Center(child: Text("-----------")),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 90,
                          width: 120,
                          child: Image.asset(
                            'images/qr.png',
                            scale: 0.6,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                  onInitialized: (controller) {
                    this.controller = controller;
                  },
                ),
              ),

              // ==========================================================
            ],
          ),
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   color: Colors.amber,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () async {
          //           /*              final selectedAddress = address ??
          //               (await FlutterBluetoothPrinter.selectDevice(context))
          //                   ?.address;

          //           if (selectedAddress != null) {
          //             controller?.print(address: selectedAddress);
          //           }*/
          //           print(address);
          //           controller?.print(address: address!);
          //           timer_printer();
          //         },
          //         child: const Text('PRINT'),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
