import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/client/add_payment_report/components/background.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/components/dateTime.dart';
import 'package:marriage_story_app/service/payment_detail_service.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_client.dart';
import 'package:marriage_story_app/routes/routes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //controller detail payment
  TextEditingController _dateController = TextEditingController();
  TextEditingController _bayarController = TextEditingController();
  //controller payment
  TextEditingController _tanggalPaymentController = TextEditingController();
  TextEditingController _tunaiKeseluruhanController = TextEditingController();
  TextEditingController _statusPaymentController = TextEditingController();
  TextEditingController _terbayarController = TextEditingController();
  TextEditingController _eventIdController = TextEditingController();
  //pengecekan date & time
  bool cekTgl = false;
  //total pembayaran
  int total = 0;
  //date & time
  DateTime tanggal = DateTime.now();
  //inisialisasi
  bool inisialisasi = false;

  final TextStyle valueStyle = TextStyle(
      color: Color(0xff828282), fontWeight: FontWeight.w500, fontSize: 14);

  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal)
      setState(() {
        cekTgl = true;
        _dateController.text = picked.toString();
        tanggal = picked;
      });
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final payment = ModalRoute.of(context)!.settings.arguments as EventModel;
    Size size = MediaQuery.of(context).size;

    // if (payment != null && inisialisasi == false) {
    //   _tunaiKeseluruhanController.text = payment.tunaiKeseluruhan.toString();
    //   _statusPaymentController.text = payment.status;
    //   _terbayarController.text = payment.terbayar;
    //   _tanggalPaymentController.text = payment.tanggal.toString();
    //   _eventIdController.text = payment.eventId.toString();

    //   inisialisasi = true;
    // }

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                padding: EdgeInsets.only(left: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Unggah",
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
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(children: [
                  dateTime(
                    // labelText: "Date",
                    valueText: cekTgl != false ? tanggal.toString() : "Tanggal",
                    valueStyle: valueStyle,
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Total Payment",
                    hintStyle: TextStyle(
                      color: Color(0xff828282),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xff828282),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  controller: _bayarController,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Upload Gambar",
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.25)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 30.w,
                decoration: BoxDecoration(
                  color: Color(0xffFB6C90).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () async {
                    const url =
                        'https://drive.google.com/drive/folders/1x8Xm3ZZsXvXXshcj3p47pBiNMb0Eqme1?usp=sharing';
                    launchURL(url);
                  },
                  child: const Text(
                    "Upload  ",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 45.w,
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
                      onPressed: () async {
                        var data = <String, dynamic>{
                          "nama_payment": "-",
                          "bayar": int.parse(_bayarController.text),
                          "tanggal": _dateController.text,
                          "detail": "-",
                        };

                        try {
                          await PaymentDetailService.createNewPaymentDetail(
                                  payment.id, data)
                              .then((response) {
                            if (response == true) {
                              Get.toNamed(RouteName.navigationClient);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                          'You have successfully create a detail payment')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Terdapat Kesalahan !')));
                            }
                          });
                        } catch (e) {
                          print(e);
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
