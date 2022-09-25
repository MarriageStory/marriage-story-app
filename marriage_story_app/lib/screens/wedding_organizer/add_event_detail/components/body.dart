import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_detail/components/background.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/event_screen.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_wo.dart';

class Body extends StatelessWidget {
  final String namaClient;
  final String tanggal;
  final String jam;
  final String tempat;
  final String totalPembayaran;
  final String catatan;
  Body(
      {Key? key,
      required this.namaClient,
      required this.tanggal,
      required this.jam,
      required this.tempat,
      required this.totalPembayaran,
      required this.catatan})
      : super(key: key);

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tambah",
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   "Kode 170564765",
                          //   style: TextStyle(
                          //     color: Color(0xffFFFFFF),
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 14,
                          //   ),
                          // ),
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
                            namaClient,
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
                height: 16,
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
                jam,
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Total Pembayaran :",
                style: TextStyle(
                  color: Color(0xffBDBDBD),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Text(
                totalPembayaran,
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
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
                catatan,
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
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45,
                    width: 180,
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
                      onPressed: () async {
                        var body = <String, dynamic>{
                          'name_client': namaClient,
                          'date': tanggal,
                          'time': jam,
                          'tempat': tempat,
                          'total_pembayaran': totalPembayaran,
                          'note': catatan,
                          'user_id': 5,
                        };

                        await EventService.createNewEvent(body);

                        Map<String, dynamic> body1 = {
                          'tunai_keseluruhan': totalPembayaran,
                          'status': "pending",
                          "terbayar": "0",
                          'tanggal': tanggal,
                          'event_id': "0",
                        };

                        try {
                          await PaymentService.createNewPayment(body1)
                              .then((value) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NavbarWeddingOrganizer(
                                index: 1,
                              );
                            }));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                        'You have successfully create a scedule')));
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Terjadi Kesalahan !')));
                        }
                      },
                      child: const Text(
                        "Selanjutnya",
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
      ),
    );
  }
}
