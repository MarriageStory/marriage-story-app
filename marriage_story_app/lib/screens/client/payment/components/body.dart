import 'package:get/get.dart';
import 'package:http/retry.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/client/payment/components/background.dart';
import 'package:marriage_story_app/model/payment_model.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/user_model.dart';
import 'package:marriage_story_app/service/auth_service.dart';
import 'package:marriage_story_app/components/formatAngka.dart';

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
      Get.offAllNamed(RouteName.splash);
      // Navigator.pushReplacementNamed(context, "/base-screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    int idPayment;
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 365,
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: 64,
                left: 20,
                right: 20,
              ),
              child: FutureBuilder(
                future: _event,
                builder: (context, AsyncSnapshot<EventsModel> snapshot) {
                  var state = snapshot.connectionState;
                  if (state != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var payment = snapshot.data!.data[index];
                          // idPayment = payment.id;

                          if (payment.gencode == user.gencode) {
                            return InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, DetailTaskClientScreen.url,
                                  //     arguments: payment);
                                },
                                child: listItemPayment(payment!));
                          }
                          return SizedBox();
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
                      return Text('No Payment');
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
                          "Jumlah Terbayar",
                          style: TextStyle(
                            color: Color(0xff000000).withOpacity(0.25),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                      future: _event,
                      builder: (context, AsyncSnapshot<EventsModel> snapshot) {
                        var state = snapshot.connectionState;
                        if (state != ConnectionState.done) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var payment = snapshot.data!.data[index];

                                if (payment.gencode == user.gencode) {
                                  return InkWell(
                                      onTap: () {
                                        // Navigator.pushNamed(
                                        //     context, DetailTaskClientScreen.url,
                                        //     arguments: payment);
                                      },
                                      child: listItemPaymentDetail(payment!));
                                }
                                return SizedBox();
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
                            return Text('No Payment');
                          }
                        }
                      },
                    ),
                  ],
                )),
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
          height: 64,
        ),
        Text(
          "Total Pembayarannn :",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 30,
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
                  offset: Offset(0, 3),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.20),
                )
              ]),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF).withOpacity(0.30),
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
      children: [
        SizedBox(
          height: 10,
        ),
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
                  child: Icon(
                    Icons.add,
                    color: Color(0xffFFFFFF),
                    size: 20,
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFB6C90),
                        Color(0xffFB8DA0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kirim Uang",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      view.statusPembayaran,
                      style: TextStyle(
                        color: Color(0xffBDBDBD),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  "+ " +
                      formatAngka.convertToIdr(
                          int.parse(view.jumlahTerbayar), 2),
                  style: TextStyle(
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
