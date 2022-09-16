import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/task/components/background.dart';

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
            height: 400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 64,
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
                    color: Color(0xffFFFFFF),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Semua",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Agenda',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                color: Color(0xffFB5490),
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Jumlah Agenda",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "3",
                              style: TextStyle(
                                color: Color(0xffFB5490),
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Agenda Selesai",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF).withOpacity(0.30),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Lihat Agenda",
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
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kamis, 23 April 2022",
                            style: TextStyle(
                              color: Color(0xffBDBDBD),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Meeting dengan MUA",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "20.00",
                        style: TextStyle(
                          color: Color(0xffFB5490),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
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
                      blurRadius: 3,
                      color: Color(0xff000000).withOpacity(0.25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
