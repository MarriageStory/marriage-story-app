import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/paymentDetail_model.dart';
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

  @override
  void initState() {
    super.initState();

    try {
      _event = EventService.getAllEvent();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final payment = ModalRoute.of(context)!.settings.arguments as EventModel;
    String tanggal = DateFormat.yMd().format(payment.date);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Pembayaran',
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
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kode ${payment.gencode}",
                          style: TextStyle(
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
                        Column(
                          children: [
                            Text(
                              payment.nameClient,
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
                        // FutureBuilder(
                        //   future: _event,
                        //   builder:
                        //       (context, AsyncSnapshot<EventsModel> snapshot) {
                        //     var state = snapshot.connectionState;
                        //     if (state != ConnectionState.done) {
                        //       return Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     } else {
                        //       if (snapshot.hasData) {
                        //         return ListView.builder(
                        //           physics: NeverScrollableScrollPhysics(),
                        //           shrinkWrap: true,
                        //           scrollDirection: Axis.vertical,
                        //           itemBuilder: (context, index) {
                        //             // var event = snapshot.data?.data.first;
                        //             var event = snapshot.data!.data[index];
                        //             // namaClient = event.nameClient;
                        //             return Column(
                        //               children: [
                        //                 Text(
                        //                   event.nameClient,
                        //                   style: const TextStyle(
                        //                     color: Color(0xffFFFFFF),
                        //                     fontWeight: FontWeight.w700,
                        //                     fontSize: 25,
                        //                   ),
                        //                 ),
                        //                 Text(
                        //                   tanggal,
                        //                   style: const TextStyle(
                        //                     color: Color(0xffFFFFFF),
                        //                     fontWeight: FontWeight.w600,
                        //                     fontSize: 14,
                        //                   ),
                        //                 ),
                        //               ],
                        //             );
                        //           },
                        //           itemCount: snapshot.data!.data.length,
                        //         );
                        //       } else if (snapshot.hasError) {
                        //         return Center(
                        //           child: Text(
                        //             snapshot.error.toString(),
                        //           ),
                        //         );
                        //       } else {
                        //         return const Text('No Schedule');
                        //       }
                        //     }
                        //   },
                        // ),
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
                  child: const Center(
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
                  width: 1.w,
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
                  child: const Center(
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
                  width: 1.w,
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
                  child: const Center(
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
                  child: const Center(
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
                  width: 1.w,
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
                  child: const Center(
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
            ),
            SizedBox(
              height: 2.h,
            ),
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
                  int.parse(payment.totalPembayaran.toString()), 2),
              style: const TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Text(
              "Transaksi Pembayaran",
              style: TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),

            // payment.paymentDetail.length != 0
            //     ? ListView.builder(
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         scrollDirection: Axis.vertical,
            //         itemBuilder: (context, index) {
            //           var payment_detail = payment.paymentDetail[index];

            //           return listItem(payment_detail);
            //         },
            //         itemCount: payment.paymentDetail.length,
            //       )
            //     : Container(
            //         margin: const EdgeInsets.only(top: 20),
            //         child: const Center(
            //           child: Text("Detail Pembayaran Masih Kosong"),
            //         ),
            //       ),
            //siniiiii

            //siniiiiii
          ],
        ),
      ),
    );
  }

  Widget listItem(PaymentDetailModel view) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFB6C90),
                    Color(0xffFB8DA0),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.add,
                color: Color(0xffFFFFFF),
                size: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Terima Uang",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  view.tanggal.toString(),
                  style: const TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              "+ Rp${view.bayar}",
              style: const TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
