import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_2/add_event_2_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

import '../../../../widgets/selected_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String paket1 = "-";
  String paket2 = "-";
  String paket3 = "-";
  String paket4 = "-";
  String paket5 = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Get.back(),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Tambah",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Acara',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                'Paket Vendor',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Center(
                child: MultiSelectContainer(
                  textStyles: const MultiSelectTextStyles(
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    disabledTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  itemsDecoration: MultiSelectDecorations(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    selectedDecoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xffFB6C90),
                          Color(0xffFB8DA0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: [
                    MultiSelectCard(
                      value: 'Pre wedding',
                      child: const SelectedCardVendor(
                        title: 'Pre Wedding',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Engagement',
                      child: const SelectedCardVendor(
                        title: 'Engagement',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Akad',
                      child: const SelectedCardVendor(
                        title: 'Akad',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Panggih',
                      child: const SelectedCardVendor(
                        title: 'Panggih',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Resepsi',
                      child: const SelectedCardVendor(
                        title: 'Resepsi',
                      ),
                    ),
                  ],
                  onChange: ((selectedItems, selectedItem) {
                    // Ini yang dibenerin Sattar kemaren tpi tipe array

                    // if (selectedPackage.contains(selectedItem)) {
                    //   selectedPackage.remove(selectedItem);
                    // } else {
                    //   selectedPackage.add(selectedItem);
                    // }
                    if (selectedItem == "Pre wedding") {
                      print(selectedItem);
                      if (paket1 == "-") {
                        paket1 = "Pre wedding";
                      } else {
                        paket1 = "-";
                      }
                    } else if (selectedItem == "Engagement") {
                      if (paket2 == "-") {
                        paket2 = "Engagement";
                      } else {
                        paket2 = "-";
                      }
                    } else if (selectedItem == "Akad") {
                      if (paket3 == "-") {
                        paket3 = "Akad";
                      } else {
                        paket3 = "-";
                      }
                    } else if (selectedItem == "Panggih") {
                      if (paket4 == "-") {
                        paket4 = "Panggih";
                      } else {
                        paket4 = "-";
                      }
                    } else if (selectedItem == "Resepsi") {
                      if (paket5 == "-") {
                        paket5 = "Resepsi";
                      } else {
                        paket5 = "-";
                      }
                    }
                  }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 5.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffFB6C90),
                          Color(0xffFB8DA0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      // onPressed: ()=>Get.toNamed(RouteName.addEvent2),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEvent2Screen(
                                    paket1: paket1,
                                    paket2: paket2,
                                    paket3: paket3,
                                    paket4: paket4,
                                    paket5: paket5,
                                  )),
                        );
                      },
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
