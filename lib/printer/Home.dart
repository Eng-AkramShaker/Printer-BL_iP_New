// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_local_variable, unused_element, camel_case_types, depend_on_referenced_packages

import 'package:all_all/printer/widget/Snack_Bar.dart';
import 'package:all_all/printer/widget/droooo.dart';
import 'package:all_all/printer/widget/switch.dart';
import 'package:all_all/printer/widget/text_Filed.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../allllllll/app_colors.dart';
import '../allllllll/color_manager.dart';
import '../allllllll/custom_text.dart';
import '../allllllll/font_manager.dart';
import 'ip/ImagestorByte.dart';
import 'ip/printer.dart';
import 'provider_all_var.dart';

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter_bluetooth_printer/flutter_bluetooth_printer_library.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';

class ip_tttt extends StatelessWidget {
  const ip_tttt({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => All_Var(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Printer Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final name_print = TextEditingController();
  bool isToggled = false;
  bool isOrderd = false;
  String? name_device = 'لا توجد أجهزة';
  bool? other_print;

  // IP  =====================================================================================

  ScreenshotController screenshotController = ScreenshotController();

  String dir = Directory.current.path;

  void testPrint(String printerIp, Uint8List theimageThatComesfr) async {
    print("im inside the test print 2");
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    final PosPrintResult res = await printer.connect(printerIp, port: 9100);
    if (res == PosPrintResult.success) {
      // DEMO RECEIPT
      await testReceipt(printer, theimageThatComesfr);
      print(res.msg);
      await Future.delayed(const Duration(seconds: 3), () {
        print("prinnter desconect");
        printer.disconnect();
      });
    }
  }

  TextEditingController Printer = TextEditingController();

  // Bluetooth  ==============================================================================

  ReceiptController? controller;
  String address = 'لا توجد أجهزة';
  bool show_Widget = false;

  //   =======================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _app_bar(),
      body: Consumer<All_Var>(builder: (context, Newww, child) {
        return Stack(
          children: [
            Center(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IP_address  ====================================================================
                      Screenshot(
                        controller: screenshotController,
                        child: SizedBox(
                          width: 140,
                          child: Custom_Column_BL_IP(Newww, 140, 22, 18),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Bluetooth  ===============================================================================

            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Receipt(
                          builder: (context) {
                            return Custom_Column_BL_IP(Newww, 180, 33, 28);
                          },
                          onInitialized: (controller) {
                            this.controller = controller;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // custom_Button  ============================================================================

            custom_Button(Newww, context),
          ],
        );
      }),
    );
  }
  // BL _ IP  ================================================================

  Column Custom_Column_BL_IP(
      All_Var Newww, double Size_img, double Size_Text, double Size_Line) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: Size_img,
          width: Size_img,
          child: Image.asset(Newww.img),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            Newww.ar_Test,
            style: TextStyle(
                fontSize: Size_Text,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            '_________________',
            style: TextStyle(
                fontSize: Size_Line,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        const SizedBox(height: 18),
        Center(
          child: Text(
            Newww.en_Test,
            style: TextStyle(
                fontSize: Size_Text,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: Size_img,
          width: Size_img,
          child: Image.asset(
            Newww.Qr_img,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  // custom_Button  ==========================================================

  Container custom_Button(All_Var Newww, BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Custom_Field(
                    hint_text: "أسم الطابعة",
                    TEXT_controller: name_print,
                  ),
                  const SizedBox(height: 15),

                  // طراز الطابعة  / الواجهة الطابعة =============================

                  drop_New(
                    ipController: Newww.ipController,
                    search_BL: search_BL(context),
                    other_print: other_print != null
                        ? other_print = true
                        : other_print = false,
                  ),

                  const SizedBox(height: 15),

                  // حجم الورقة' ====================================================

                  // const Custom_Drop2(hintText: 'حجم الورقة'),

                  //  إختبار الطابعة ================================================
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // IP =======================================================

                        if (Newww.ethernet == true) {
                          screenshotController
                              .capture(delay: const Duration(milliseconds: 10))
                              .then((capturedImage) async {
                            theimageThatComesfromThePrinter = capturedImage!;
                            setState(() {
                              theimageThatComesfromThePrinter = capturedImage;
                              testPrint(Newww.ipController.text,
                                  theimageThatComesfromThePrinter);

                              print('///////////////////////////////');
                              print(Newww.ipController.text);
                            });
                            Snak_Bar(context, 'تم بنجاح', Colors.green);
                          }).catchError((onError) {
                            print(onError);
                            Snak_Bar(context, 'لم يتم بنجاح', Colors.green);
                          });

                          // BL =======================================================
                        } else if (Newww.bluetooth == true) {
                          print(address);
                          controller?.print(address: address);
                          Snak_Bar(context, 'تم بنجاح', Colors.green);

                          // usb =======================================================
                        } else if (Newww.usb == true) {
                          //
                        }

                        print('/////////////////////');
                        print(Newww.ethernet);
                        print(Newww.bluetooth);
                        print(Newww.usb);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 48),
                      backgroundColor: AppColors.current.success,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'إختبار الطابعة',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          color: AppColors.current.neutral),
                    ),
                  ),

                  //  ------------------------------------------------------------------
                  const SizedBox(height: 15),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              coustom_switch(isToggled: isToggled),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  " طباعة  فواتير البيع",
                                  style: TextStyle(
                                    color: AppColors.current.dimmedLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              coustom_switch(isToggled: isToggled),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  " طباعة  مرتجعات البيع",
                                  style: TextStyle(
                                    color: AppColors.current.dimmedLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              coustom_switch(isToggled: isToggled),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "طباعة  الايصالات",
                                  style: TextStyle(
                                    color: AppColors.current.dimmedLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              coustom_switch(isToggled: isToggled),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "طباعة  السندات",
                                  style: TextStyle(
                                    color: AppColors.current.dimmedLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ================================================

                              FlutterSwitch(
                                height: 20.0,
                                width: 40.0,
                                padding: 4.0,
                                toggleSize: 15.0,
                                borderRadius: 10.0,
                                inactiveColor: AppColors.current.dimmedLight,
                                activeColor: AppColors.current.primary,
                                value: isOrderd,
                                onToggle: (value) {
                                  setState(() {
                                    isOrderd = value;
                                  });
                                },
                              ),

                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "طباعة  الطلبات",
                                  style: TextStyle(
                                    color: AppColors.current.dimmedLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          isOrderd == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // coustom_switch(isToggled: isToggled),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppColors.current.wite_new),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18,
                                              right: 10,
                                              top: 10,
                                              bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "أختيار مجموعات الطباعة",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .current.dimmedLight),
                                                ),
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 160,
                                                      ),
                                                      child: coustom_switch(
                                                          isToggled: isToggled),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Text(
                                                        "الدجاج",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .current
                                                                .dimmedLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15, bottom: 15),
                                                child: SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 155,
                                                        ),
                                                        child: coustom_switch(
                                                            isToggled:
                                                                isToggled),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 5),
                                                        child: Text(
                                                          "الشاورما",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .current
                                                                  .dimmedLight),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 155,
                                                      ),
                                                      child: coustom_switch(
                                                          isToggled: isToggled),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Text(
                                                        "المقبلات",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .current
                                                                .dimmedLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 65),

                  //   تأكيد  ======================================================================================
                  ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 48),
                      backgroundColor: AppColors.current.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'تأكيد',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          color: AppColors.current.success),
                    ),
                  ),
                  // ========================================================================================
                  SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // App Bar -----------------------------------------------------------------

  AppBar _app_bar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.current.primary,
      leadingWidth: 40,
      elevation: 0.0,
      titleSpacing: 0,
      foregroundColor: AppColors.current.success,
      title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomText(
            title: 'الطابعة',
            color: ColorManager.success,
            fontWeight: FontWeightManager.medium,
            size: 18,
          )),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.arrow_forward,
              size: 36,
              color: AppColors.current.success,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  //  search_Bluetooth  ======================================================

  Row search_BL(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () async {
            //
            final selected =
                await FlutterBluetoothPrinter.selectDevice(context);
            if (selected != null) {
              setState(() {
                address = selected.address;
                print(selected.type);
                print(address);
                name_device = selected.name.toString();
                Snak_Bar(context, 'تم الإتصال بنجاح', Colors.green);
              });
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 35),
            backgroundColor: AppColors.current.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 0,
          ),
          child: Container(
            child: Text(
              'بحث',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  color: AppColors.current.neutral),
            ),
          ),
        ),
        const SizedBox(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.current.primary),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 7, bottom: 7, left: 20, right: 20),
            child: Text('$name_device',
                style: TextStyle(
                    color: AppColors.current.dimmedLight,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
