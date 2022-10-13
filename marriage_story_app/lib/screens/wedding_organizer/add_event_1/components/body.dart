import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart'; 
import 'package:marriage_story_app/screens/wedding_organizer/add_event_1/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Get.back(),
              ),
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 30,
              ),
              Text(
                'Paket Vendor',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: GroupButton(
                  buttons: [
                    "Pre-Wedding",
                    "Engagement",
                    "Akad",
                    "Panggih",
                    "Resepsi",
                  ],
                  isRadio: false,
                  options: GroupButtonOptions(
                    selectedShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(1, 1),
                        color: Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                    selectedTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    ),
                    selectedColor: Color(0xFFFB6C90),
                    selectedBorderColor: Color(0xFFFB6C90),
                    unselectedShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(1, 1),
                        color: Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                    unselectedTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4F4F4F),
                    ),
                    unselectedColor: Color(0xFFFFFFFF),
                    unselectedBorderColor: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                    spacing: 20,
                    runSpacing: 20,
                    groupingType: GroupingType.wrap,
                    direction: Axis.horizontal,
                    buttonHeight: 130,
                    buttonWidth: 160,
                    mainGroupAlignment: MainGroupAlignment.start,
                    crossGroupAlignment: CrossGroupAlignment.start,
                    groupRunAlignment: GroupRunAlignment.start,
                    textAlign: TextAlign.center,
                    textPadding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    elevation: 0,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45,
                    width: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                      onPressed: ()=>Get.toNamed(RouteName.addEvent2),
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
