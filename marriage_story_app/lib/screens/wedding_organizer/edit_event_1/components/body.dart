// import 'package:get/get.dart';
// import 'package:marriage_story_app/routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:group_button/group_button.dart';
// import 'package:marriage_story_app/screens/wedding_organizer/add_event_1/components/background.dart';

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: Container(
//         height: size.height,
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.only(
//             top: 32,
//             left: 20,
//             right: 20,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                 icon: Icon(
//                   Icons.arrow_back,
//                 ),
//                 onPressed: () => Get.back(),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Tambah",
//                 style: TextStyle(
//                   color: Color(0xff333333),
//                   fontWeight: FontWeight.w700,
//                   fontSize: 25,
//                 ),
//               ),
//               Text(
//                 'Acara',
//                 style: TextStyle(
//                   color: Color(0xff333333),
//                   fontWeight: FontWeight.w700,
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 'Paket Vendor',
//                 style: TextStyle(
//                   color: Color(0xff333333),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Center(
//                 child: GroupButton(
//                   buttons: [
//                     "Pre-Wedding",
//                     "Engagement",
//                     "Akad",
//                     "Panggih",
//                     "Resepsi",
//                   ],
//                   // onSelected: (index, isSelected){},
//                   isRadio: false,
//                   options: GroupButtonOptions(
//                     selectedShadow: [
//                       BoxShadow(
//                         blurRadius: 6,
//                         offset: Offset(1, 1),
//                         color: Color(0xff000000).withOpacity(0.25),
//                       ),
//                     ],
//                     selectedTextStyle: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFFFFFFFF),
//                     ),
//                     selectedColor: Color(0xFFFB6C90),
//                     selectedBorderColor: Color(0xFFFB6C90),
//                     unselectedShadow: [
//                       BoxShadow(
//                         blurRadius: 6,
//                         offset: Offset(1, 1),
//                         color: Color(0xff000000).withOpacity(0.25),
//                       ),
//                     ],
//                     unselectedTextStyle: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xff4F4F4F),
//                     ),
//                     unselectedColor: Color(0xFFFFFFFF),
//                     unselectedBorderColor: Color(0xFFFFFFFF),
//                     borderRadius: BorderRadius.circular(15),
//                     spacing: 20,
//                     runSpacing: 20,
//                     groupingType: GroupingType.wrap,
//                     direction: Axis.horizontal,
//                     buttonHeight: 100,
//                     buttonWidth: 120,
//                     mainGroupAlignment: MainGroupAlignment.start,
//                     crossGroupAlignment: CrossGroupAlignment.start,
//                     groupRunAlignment: GroupRunAlignment.start,
//                     textAlign: TextAlign.center,
//                     textPadding: EdgeInsets.zero,
//                     alignment: Alignment.center,
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 45,
//                     width: 180,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color(0xffFB6C90),
//                           Color(0xffFB8DA0),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: TextButton(
//                       onPressed: ()=>Get.toNamed(RouteName.addEvent2),
//                       child: const Text(
//                         "Selanjutnya",
//                         style: TextStyle(
//                           color: Color(0xffFFFFFF),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_1/components/background.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_2/edit_event_2_screen.dart';

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
  bool inisialisasi = false;

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    Size size = MediaQuery.of(context).size;
    if (event != Null && inisialisasi == false) {
      paket1 = event.paket1;
      paket2 = event.paket2;
      paket3 = event.paket3;
      paket4 = event.paket4;
      paket5 = event.paket5;
      inisialisasi = true;
    }

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
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Edit",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    minWidth: 160,
                    height: 100,
                    child: ElevatedButton(
                      // color: Color(0xffFFFFFF),
                      onPressed: () {
                        if (paket1 == "-") {
                          paket1 = "Akad";
                        } else {
                          paket1 = "-";
                        }
                      },
                      child: Text(
                        "Pre-Wedding",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 160,
                    height: 100,
                    child: ElevatedButton(
                      // color: Color(0xffFFFFFF),
                      onPressed: () {
                        if (paket2 == "-") {
                          paket2 = "Akad";
                        } else {
                          paket2 = "-";
                        }
                      },
                      child: Text(
                        "Engagement",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    minWidth: 160,
                    height: 100,
                    child: ElevatedButton(
                      // color: Color(0xffFFFFFF),
                      onPressed: () {
                        if (paket3 == "-") {
                          paket3 = "Akad";
                        } else {
                          paket3 = "-";
                        }
                      },
                      child: Text(
                        "Akad",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 160,
                    height: 100,
                    child: ElevatedButton(
                      // color: Color(0xffFFFFFF),
                      onPressed: () {
                        if (paket4 == "-") {
                          paket4 = "Akad";
                        } else {
                          paket4 = "-";
                        }
                      },
                      child: Text(
                        "Panggih",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ButtonTheme(
                    minWidth: 160,
                    height: 100,
                    child: ElevatedButton(
                      // color: Color(0xffFFFFFF),
                      onPressed: () {
                        if (paket5 == "-") {
                          paket5 = "Akad";
                        } else {
                          paket5 = "-";
                        }
                      },
                      child: Text(
                        "Resepsi",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      // onPressed: ()=>Get.toNamed(RouteName.addEvent2),
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            // MaterialPageRoute(
                            //     builder: (context) => EditEvent2Screen(
                            //           paket1: paket1,
                            //           paket2: paket2,
                            //           paket3: paket3,
                            //           paket4: paket4,
                            //           paket5: paket5,
                            //         )), arguments: event
                            EditEvent2Screen(
                              paket1: paket1,
                              paket2: paket2,
                              paket3: paket3,
                              paket4: paket4,
                              paket5: paket5,
                            ).url,
                            arguments: event);
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
