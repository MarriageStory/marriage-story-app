import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/welcome/components/background.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 64,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hai,",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'User !',
                          style: TextStyle(
                            color: Color(0xffFB6C90),
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/user-profile.png",
                      height: 50,
                    )
                  ],
                ),
                SizedBox(
                  height: 64,
                ),
                Container(
                  height: 125,
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Kamu,",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Wedding Organizer",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(1, 1),
                        color: Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 30, 100, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Acara",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                color: Color(0xffFB6C90),
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(1, 1),
                            color: Color(0xff000000).withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 30, 100, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Agenda",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                color: Color(0xffFB6C90),
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(1, 1),
                            color: Color(0xff000000).withOpacity(0.25),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 52,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Semua Acara",
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
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
                                    borderRadius: BorderRadius.circular(5),
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
                                    borderRadius: BorderRadius.circular(5),
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
                                    borderRadius: BorderRadius.circular(5),
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
                                    borderRadius: BorderRadius.circular(5),
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
                                    borderRadius: BorderRadius.circular(5),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(1, 1),
                        color: Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
