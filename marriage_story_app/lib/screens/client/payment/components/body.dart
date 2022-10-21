import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/client/payment/components/background.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/user_model.dart';
import 'package:marriage_story_app/service/auth_service.dart';
import 'package:marriage_story_app/components/formatAngka.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Body extends StatefulWidget {
  // static const routeName = '/payment-client-screen';
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // late Future<PaymentsModel> _payment;
  late Future<EventsModel> _event;

  UserModel user = UserModel(
      id: 0,
      name: "",
      email: "",
      emailVerifiedAt: DateTime.now(),
      roleName: "",
      gencode: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  void initState() {
    super.initState();
    getUserProfile();

    try {
      // _payment = PaymentService.getAllPayments();
      _event = EventService.getAllEvent();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserProfile() async {
    try {
      var data = await AuthService.authUserProfile();

      setState(() {
        user = data;
      });
    } catch (e) {
      // Get.offAllNamed(RouteName.splash);
      print("e");
      // Navigator.pushReplacementNamed(context, "/base-screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    int idPayment;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFB6C90),
                  Color(0xffFB8DA0),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                left: 20,
                right: 20,
              ),
              child: FutureBuilder(
                future: _event,
                builder: (context, AsyncSnapshot<EventsModel> snapshot) {
                  var state = snapshot.connectionState;
                  if (state != ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var payment = snapshot.data!.data[index];
                          // idPayment = payment.id;

                          if (payment.gencode == user.gencode) {
                            return GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, DetailTaskClientScreen.url,
                                  //     arguments: payment);
                                },
                                child: listItemPayment(payment!));
                          }
                          return const SizedBox();
                        },
                        itemCount: snapshot.data!.data.length,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return const Text('No Payment');
                    }
                  }
                },
              ),

              //batas
              // child: ListView.builder(
              //         physics: NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         scrollDirection: Axis.vertical,
              //         itemBuilder: (context, index) {
              //     var payment_detail = payment.paymentDetails[index];

              //     return listItemPaymentDetail(payment_detail);
              //   },
              //   // itemCount: payment.paymentDetails.length,
              // )
              //batas

              //disini woiiii
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 2.h,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah Terbayar",
                  style: TextStyle(
                    color: Color(0xff000000).withOpacity(0.25),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: _event,
            builder: (context, AsyncSnapshot<EventsModel> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var payment = snapshot.data!.data[index];

                        if (payment.gencode == user.gencode) {
                          return GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, DetailTaskClientScreen.url,
                                //     arguments: payment);
                              },
                              child: listItemPaymentDetail(payment!));
                        }
                        return const SizedBox();
                      },
                      itemCount: snapshot.data!.data.length,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else {
                  return const Text('No Payment');
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget listItemPayment(EventModel view) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
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
          height: 10.h,
        ),
        const Text(
          "Total Pembayarannn :",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          formatAngka.convertToIdr(
              int.parse(view.totalPembayaran.toString()), 2),
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: const Offset(0, 0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                )
              ]),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF).withOpacity(0.30),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  if (int.parse(view.jumlahTerbayar) < view.totalPembayaran) {
                    Get.toNamed(RouteName.addPaymentClient, arguments: view);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Pembayaran anda telah lunas')));
                  }
                },
                child: const Text(
                  "Upload Pembayaran",
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
    );
  }

  Widget listItemPaymentDetail(EventModel view) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffFFFFFF),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0xff000000).withOpacity(0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  padding: const EdgeInsets.all(5),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kirim Uang",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        view.statusPembayaran,
                        style: const TextStyle(
                          color: Color(0xffBDBDBD),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "+ ${formatAngka.convertToIdr(int.parse(view.jumlahTerbayar), 2)}",
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
      ],
    );
  }
}
