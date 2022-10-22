import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/service/payment_detail_service.dart';
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
  late Future<PaymentDetailsModel> _paymentDetail;
  bool punyaData = false;
  int count = 1;

  @override
  void initState() {
    super.initState();

    try {
      _paymentDetail = PaymentDetailService.getAllPaymentDetails(1);
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
                payment.paket1 != "-"
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
                                payment.paket1,
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
                        ],
                      )
                    : SizedBox(),
                payment.paket2 != "-"
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
                                payment.paket2,
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
                        ],
                      )
                    : SizedBox(),
                payment.paket3 != "-"
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
                                payment.paket3,
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
                        ],
                      )
                    : SizedBox(),
                payment.paket4 != "-"
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
                                payment.paket4,
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
                        ],
                      )
                    : SizedBox(),
                payment.paket5 != "-"
                    ? Container(
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
                            payment.paket5,
                            style: TextStyle(
                              color: Color(0xffFB6C90),
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
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
            FutureBuilder(
              future: _paymentDetail,
              builder: (context, AsyncSnapshot<PaymentDetailsModel> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data!.data.length > 0) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var paymentDetail = snapshot.data!.data[index];
                            if (paymentDetail.eventId == payment.id) {
                              punyaData = true;
                              return listItem(paymentDetail!);
                            }
                            if (punyaData == false &&
                                count == snapshot.data!.data.length) {
                              return Center(
                                child: Text(
                                  "belum ada pembayaran",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              );
                            }
                            count++;
                            return SizedBox();
                          },
                          itemCount: snapshot.data!.data.length,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          "belum ada pembayaran",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else {
                    return const Text('Tidak Ada Acara');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(PaymentDetailModel view) {
    return Column(
      children: [
        Container(
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
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
