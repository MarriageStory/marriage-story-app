import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_2/components/background.dart';
import 'package:marriage_story_app/components/dateTime.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_detail/add_event_detail_screen.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  // Body({Key? key}) : super(key: key);
  final String paket1;
  final String paket2;
  final String paket3;
  final String paket4;
  final String paket5;
  Body(
      {Key? key,
      required this.paket1,
      required this.paket2,
      required this.paket3,
      required this.paket4,
      required this.paket5})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState(
      paket1: paket1,
      paket2: paket2,
      paket3: paket3,
      paket4: paket4,
      paket5: paket5);
}

class _BodyState extends State<Body> {
  // _BodyState({Key? key});
  String paket1;
  String paket2;
  String paket3;
  String paket4;
  String paket5;
  _BodyState(
      {Key? key,
      required this.paket1,
      required this.paket2,
      required this.paket3,
      required this.paket4,
      required this.paket5});

  //controller
  TextEditingController _nameClientController = TextEditingController();
  TextEditingController _totalPembayaranController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  //pengecekan date & time
  bool cekJam = false;
  bool cekTgl = false;
  bool inisialisasi = false;
  //date & time
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  final TextStyle valueStyle = TextStyle(
      color: Color(0xff828282), fontWeight: FontWeight.w500, fontSize: 14);

  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        cekJam = true;
        _timeController.text = value!.format(context).toString();
      });
    });
  }

  Future<Null> _selectDate(BuildContext context, DateTime date) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal)
      setState(() {
        cekTgl = true;
        _dateController.text = picked.toString();
        tanggal = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    Size size = MediaQuery.of(context).size;

    if (event != Null && inisialisasi == false) {
      _nameClientController.text = event.nameClient;
      _totalPembayaranController.text = event.totalPembayaran.toString();
      _dateController.text = event.date.toString();
      _placeController.text = event.tempat;
      _timeController.text = event.time;
      _noteController.text = event.note;
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
                onPressed: () => Get.back(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Edit",
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
              Text(
                'Kelengkapan Acara',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Pengantin",
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
                  controller: _nameClientController,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                child: Column(children: [
                  dateTime(
                    // labelText: "Date",
                    valueText: cekTgl != true
                        ? DateFormat.yMd().format(event.date)
                        : DateFormat.yMd().format(tanggal),
                    valueStyle: valueStyle,
                    onPressed: () {
                      _selectDate(context, event.date);
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                child: Column(children: [
                  dateTime(
                    // labelText: "Date",
                    valueText: _timeController.text,
                    valueStyle: valueStyle,
                    onPressed: () {
                      showTime();
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tempat Agenda",
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
                  controller: _placeController,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Total Pembayaran",
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
                  controller: _totalPembayaranController,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Catatan",
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
                  controller: _noteController,
                ),
              ),
              SizedBox(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEventDetailScreen(
                                    paket1: event.paket1,
                                    paket2: event.paket2,
                                    paket3: event.paket3,
                                    paket4: event.paket4,
                                    paket5: event.paket5,
                                    namaClient: _nameClientController.text,
                                    tanggal: tanggal,
                                    jam: _timeController.text,
                                    tempat: _placeController.text,
                                    totalPembayaran:
                                        _totalPembayaranController.text,
                                    catatan: _noteController.text,
                                    eventId: event.id,
                                  )),
                        );
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