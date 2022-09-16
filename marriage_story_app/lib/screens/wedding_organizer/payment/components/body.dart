import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/payment/components/background.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 64,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pembayaran",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    "Total Pembayaran",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFB6C90),
                  Color(0xffFB8DA0),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Semua Pembayaran",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/poster-1.png",
                                height: 95,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pernikahan Aan dan Ainul",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "25 Agustus 2022",
                                    style: TextStyle(
                                      color: Color(0xffBDBDBD),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xffFB6C90),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Pre-wedding",
                                            style: TextStyle(
                                              color: Color(0xffFB6C90),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xffFB6C90),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Engagement",
                                            style: TextStyle(
                                              color: Color(0xffFB6C90),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xffFB6C90),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Akad",
                                            style: TextStyle(
                                              color: Color(0xffFB6C90),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xffFB6C90),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Panggih",
                                            style: TextStyle(
                                              color: Color(0xffFB6C90),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xffFB6C90),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Resepsi",
                                            style: TextStyle(
                                              color: Color(0xffFB6C90),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Rp30.000.000,00",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffFB6C90),
                                Color(0xffFB8DA0),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
