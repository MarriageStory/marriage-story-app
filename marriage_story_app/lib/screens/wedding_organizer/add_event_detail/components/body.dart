import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_detail/components/background.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/event_screen.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_wo.dart';
import 'package:marriage_story_app/components/formatAngka.dart';

class Body extends StatelessWidget {
  final String paket1;
  final String paket2;
  final String paket3;
  final String paket4;
  final String paket5;
  final String namaClient;
  final String tanggal;
  final String jam;
  final String tempat;
  final String totalPembayaran;
  final String catatan;
  Body(
      {Key? key,
      required this.paket1,
      required this.paket2,
      required this.paket3,
      required this.paket4,
      required this.paket5,
      required this.namaClient,
      required this.tanggal,
      required this.jam,
      required this.tempat,
      required this.totalPembayaran,
      required this.catatan})
      : super(key: key);

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
                    paket1 != "-"
                        ?
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
                                paket1,
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    paket2 != "-"
                        ?
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
                                paket2,
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    paket3 != "-"
                        ?
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
                                paket3,
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    paket4 != "-"
                        ?
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
                                paket4,
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    paket5 != "-"
                        ?
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
                                paket5,
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
                  formatAngka.convertToIdr(int.parse(totalPembayaran), 2),
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
                            'status_pembayaran': "pending",
                            'jumlah_terbayar': "0",
                            'note': catatan,
                            'paket1': paket1,
                            'paket2': paket2,
                            'paket3': paket3,
                            'paket4': paket4,
                            'paket5': paket5,
                          };

                          try {
                            await EventService.createNewEvent(body)
                                .then((value) {
                              Get.toNamed(RouteName.navigationWo);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return NavbarWeddingOrganizer(
                              //         index: 1,
                              //       );
                              //     },
                              //   ),
                              // );
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
      ),
    );
  }
}
