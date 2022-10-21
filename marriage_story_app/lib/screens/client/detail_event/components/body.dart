import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/client/detail_event/components/background.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:get/get.dart';
import 'package:marriage_story_app/components/formatAngka.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  children: const [
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
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kode ${event.gencode}",
                            style: const TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Pernikahan",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            event.nameClient,
                            style: const TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            tanggal,
                            style: const TextStyle(
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
                height: 2.h,
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
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            )
                          ],
                        )
                      : const SizedBox(),
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
                                  color: const Color(0xffFB6C90),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  event.paket2,
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            )
                          ],
                        )
                      : const SizedBox(),
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
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            )
                          ],
                        )
                      : const SizedBox(),
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
                                  color: const Color(0xffFB6C90),
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
                            SizedBox(
                              width: 1.w,
                            )
                          ],
                        )
                      : const SizedBox(),
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
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            )
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              const Text(
                "Waktu Pelaksanaan :",
                style: TextStyle(
                  color: Color(0xffBDBDBD),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Text(
                "${event.time} WIB",
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
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
                        style: const TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
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
                height: 2.h,
              ),
              const Text(
                "Catatan :",
                style: TextStyle(
                  color: Color(0xffBDBDBD),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Text(
                event.note,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
