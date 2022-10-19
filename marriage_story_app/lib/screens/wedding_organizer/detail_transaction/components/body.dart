import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_transaction/components/background.dart';

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
      child: SingleChildScrollView(
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
                  "Detail",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Transaksi',
                  style: TextStyle(
                    color: Color(0xff333333),
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
                    Text(
                      "Senin, 24 Agustus 2022",
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "15.21",
                      style: TextStyle(
                        color: Color(0xffBDBDBD),
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
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "+ Rp10.000.000,00",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Bukti Transfer :",
                  style: TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/receipt.png")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
