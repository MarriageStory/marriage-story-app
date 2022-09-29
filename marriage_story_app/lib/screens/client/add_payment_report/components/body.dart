import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/client/add_payment_report/components/background.dart';
import 'package:marriage_story_app/model/payment_model.dart';
import 'package:marriage_story_app/components/dateTime.dart';
import 'package:marriage_story_app/service/payment_detail_service.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_client.dart';

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
    final payment = ModalRoute.of(context)!.settings.arguments as PaymentModel;
    Size size = MediaQuery.of(context).size;

    if (payment != null && inisialisasi == false) {
      _tunaiKeseluruhanController.text = payment.tunaiKeseluruhan.toString();
      _statusPaymentController.text = payment.status;
      _terbayarController.text = payment.terbayar;
      _tanggalPaymentController.text = payment.tanggal.toString();
      _eventIdController.text = payment.eventId.toString();

      inisialisasi = true;
    }

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
              SizedBox(
                height: 58,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  // margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(children: [
                    dateTime(
                      // labelText: "Date",
                      valueText:
                          cekTgl != false ? tanggal.toString() : "Tanggal",
                      valueStyle: valueStyle,
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Total Payment",
                    hintStyle: const TextStyle(
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
              const SizedBox(
                height: 30,
              ),
              Text(
                "Upload Gambar",
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.25)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 145,
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
              const SizedBox(
                height: 100,
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
                        var data = <String, dynamic>{
                          "nama_payment": "-",
                          "bayar": int.parse(_bayarController.text),
                          "tanggal": _dateController.text,
                          "detail": "-",
                        };

                        try {
                          await PaymentDetailService.createNewPaymentDetail(
                              payment.id, data);
                        } catch (e) {
                          print(e);
                        }

                        total = int.parse(_terbayarController.text) +
                            int.parse(_bayarController.text);
                        if (total ==
                            int.parse(_tunaiKeseluruhanController.text)) {
                          _statusPaymentController.text = "done";
                        }

                        Map<String, dynamic> body1 = {
                          'tunai_keseluruhan': payment.tunaiKeseluruhan,
                          'status': _statusPaymentController.text,
                          'terbayar': total.toString(),
                          'tanggal': payment.tanggal.toString(),
                          'event_id': payment.eventId,
                        };

                        await PaymentService.updatePayment(payment.id, body1)
                            .then((response) {
                          if (response == true) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NavbarClient(
                                index: 2,
                              );
                            }));
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
