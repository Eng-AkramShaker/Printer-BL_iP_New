// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, avoid_unnecessary_containers

import 'package:all_all/printer/provider_all_var.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../allllllll/app_colors.dart';
import '../usb/usb.dart';

class drop_New extends StatefulWidget {
  drop_New({
    super.key,
    required this.ipController,
    required this.search_BL,
    required this.other_print,
  });

  bool other_print = false;
  var ipController = TextEditingController();
  var search_BL;

  @override
  State<drop_New> createState() => _drop_NewState();
}

class _drop_NewState extends State<drop_New> {
  // ======================================================================
  String? selectedValue22;
  String v_1 = "Sunmi";
  String v_2 = "طراز اخر";

  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: v_1,
          child: Text(
            v_1,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
      DropdownMenuItem(
          value: v_2,
          child: Text(
            v_2,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
    ];
    return menuItems;
  }

  //  ======================================================================
  String? selectedValue;
  TextEditingController controller = TextEditingController();

  dynamic v_3 = "Ethernet";
  dynamic v_4 = "Bluetooth";
  dynamic v_5 = "USB";

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: v_3,
          child: Text(
            v_3,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
      DropdownMenuItem(
          value: v_4,
          child: Text(
            v_4,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
      DropdownMenuItem(
          value: v_5,
          child: Text(
            v_5,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Form(child: Consumer<All_Var>(builder: (context, Newww, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: "طراز الطابعة",
                fillColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.current.dimmedLight.withOpacity(0.2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.current.dimmedLight.withOpacity(0.2),
                  ),
                ),
              ),
              dropdownColor: const Color.fromARGB(255, 245, 244, 244),
              value: selectedValue22,
              onChanged: (String? newValue) {
                setState(() {
                  widget.other_print = true;

                  selectedValue22 = newValue!.toString();

                  print(selectedValue22.toString());

                  selectedValue22.toString() == "طراز اخر"
                      ? widget.other_print = true
                      : widget.other_print = false;

                  print(widget.other_print);
                });
              },
              items: dropdownItems1),
          widget.other_print == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Form(
                      child: Column(
                    children: [
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'واجهة الطابعة',
                            fillColor: Colors.transparent,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.current.dimmedLight
                                    .withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.current.dimmedLight
                                    .withOpacity(0.2),
                              ),
                            ),
                          ),
                          dropdownColor:
                              const Color.fromARGB(255, 245, 244, 244),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              widget.other_print = true;
                              selectedValue = newValue!;
                              print(newValue);

                              // ------------------------------------------------

                              newValue == 'Ethernet'
                                  ? Newww.bool_ethernet()
                                  : Newww.ethernet = false;

                              newValue == 'Bluetooth'
                                  ? Newww.bool_bluetooth()
                                  : Newww.bluetooth = false;

                              newValue == 'USB'
                                  ? Newww.bool_usb()
                                  : Newww.usb = false;
                            });
                          },
                          items: dropdownItems2),

                      // `````````````````````````````````````````````````````````````````

                      selectedValue == 'Ethernet'
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15),
                              child: TextField(
                                controller: widget.ipController,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "IP Address",
                                  fillColor: Colors.transparent,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.current.dimmedLight
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.current.dimmedLight
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),

                      // `````````````````````````````````````````````````````````````````

                      selectedValue == 'Bluetooth'
                          ? SizedBox(
                              height: 80,
                              width: 300,
                              child: widget.search_BL,
                            )
                          : Container(),

                      // `````````````````````````````````````````````````````````````````

                      selectedValue == 'USB'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 30,
                                width: 80,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Screen_USB()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(50, 15),
                                    backgroundColor: AppColors.current.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'usb',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: 'Tajawal',
                                          color: AppColors.current.neutral),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )))
              : Container(),
        ],
      );
    }));
  }
}

// حجم الورقة   ======================================================================================
class Custom_Drop2 extends StatefulWidget {
  const Custom_Drop2({
    super.key,
    selectedValue,
    required this.hintText,
  });
  final String? hintText;
  @override
  State<Custom_Drop2> createState() => Custom_Drop2State();
}

class Custom_Drop2State extends State<Custom_Drop2> {
  String? selectedValue;

  dynamic v_1 = "80mm";
  dynamic v_2 = "58mm";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: v_1,
          child: Text(
            v_1,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
      DropdownMenuItem(
          value: v_2,
          child: Text(
            v_2,
            style: TextStyle(
              color: AppColors.current.dimmedLight,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          )),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              hintText: widget.hintText,
              fillColor: Colors.transparent,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.current.dimmedLight.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.current.dimmedLight.withOpacity(0.2),
                ),
              ),
            ),
            dropdownColor: const Color.fromARGB(255, 245, 244, 244),
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: dropdownItems),
        const SizedBox(height: 20),
        // Text(
        //   selectedValue == null ? "" : selectedValue.toString(),
        //   style: const TextStyle(fontSize: 20),
        // )
      ],
    ));
  }
}
