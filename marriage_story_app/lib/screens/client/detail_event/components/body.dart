import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/client/detail_event/components/background.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:marriage_story_app/model/payment_model.dart';
import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:marriage_story_app/components/formatAngka.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<EventsModel> _event;
  // late Future<PaymentsModel> _payment;
  bool cetak = false;

  @override
  void initState() {
    super.initState();

    try {
      _event = EventService.getAllEvent();
      // _payment = PaymentService.getAllPayments();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    String tanggal = DateFormat.yMd().format(event.date);

    return Background(
      child: ListView(
        children: [
          Container(
            // height: size.height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                        ),
                        onPressed: () {},
                      ),
                    ],
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
                  Container(
                    width: size.width,
                    height: 160,
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
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kode " + event.gencode,
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Pernikahan",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                event.nameClient,
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                tanggal,
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      event.paket1 != "-"
                          ? Row(
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
                                      event.paket1,
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
                                )
                              ],
                            )
                          : SizedBox(),
                      event.paket2 != "-"
                          ? Row(
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
                                      event.paket2,
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
                                )
                              ],
                            )
                          : SizedBox(),
                      event.paket3 != "-"
                          ? Row(
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
                                      event.paket3,
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
                                )
                              ],
                            )
                          : SizedBox(),
                      event.paket4 != "-"
                          ? Row(
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
                                      event.paket4,
                                      style: const TextStyle(
                                        color: Color(0xffFB6C90),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                )
                              ],
                            )
                          : SizedBox(),
                      event.paket5 != "-"
                          ? Row(
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
                                      event.paket5,
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
                                )
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Waktu Pelaksanaan :",
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    event.time + " WIB",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Pembayaran :",
                            style: TextStyle(
                              color: Color(0xffBDBDBD),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            formatAngka.convertToIdr(
                                int.parse(event.totalPembayaran.toString()), 2),
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 170,
                        height: 45,
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
                          onPressed: () {},
                          child: const Text(
                            "Lihat  Pembayaran",
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Catatan :",
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),

                  Text(
                    event.note,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),

                  // Text(
                  //   "Fotografer : Jono Samsudin",
                  //   style: TextStyle(
                  //     color: Color(0xff333333),
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 12,
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
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
