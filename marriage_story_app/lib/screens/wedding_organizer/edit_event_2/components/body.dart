import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_2/components/background.dart';
import 'package:marriage_story_app/components/dateTime.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_detail/add_event_detail_screen.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Body extends StatefulWidget {
  // Body({Key? key}) : super(key: key);
  final String paket1;
  final String paket2;
  final String paket3;
  final String paket4;
  final String paket5;
  final String nameClient;
  final int totalPembayaran;
  final DateTime date;
  final String tempat;
  final String jam;
  final String note;
  final int eventId;
  Body({
    Key? key,
    required this.paket1,
    required this.paket2,
    required this.paket3,
    required this.paket4,
    required this.paket5,
    required this.nameClient,
    required this.totalPembayaran,
    required this.date,
    required this.tempat,
    required this.jam,
    required this.note,
    required this.eventId,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState(
      paket1: paket1,
      paket2: paket2,
      paket3: paket3,
      paket4: paket4,
      paket5: paket5,
      nameClient: nameClient,
      totalPembayaran: totalPembayaran,
      date: date,
      tempat: tempat,
      jam: jam,
      note: note,
      eventId: eventId);
}

class _BodyState extends State<Body> {
  // _BodyState({Key? key});
  String paket1;
  String paket2;
  String paket3;
  String paket4;
  String paket5;
  String nameClient;
  int totalPembayaran;
  DateTime date;
  String tempat;
  String jam;
  String note;
  int eventId;
  _BodyState({
    Key? key,
    required this.paket1,
    required this.paket2,
    required this.paket3,
    required this.paket4,
    required this.paket5,
    required this.nameClient,
    required this.totalPembayaran,
    required this.date,
    required this.tempat,
    required this.jam,
    required this.note,
    required this.eventId,
  });

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
    // final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    Size size = MediaQuery.of(context).size;

    if (inisialisasi == false) {
      _nameClientController.text = nameClient;
      _totalPembayaranController.text = totalPembayaran.toString();
      _dateController.text = date.toString();
      _placeController.text = tempat;
      _timeController.text = jam;
      _noteController.text = note;
      inisialisasi = true;
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
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
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                'Kelengkapan Acara',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
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
                    hintText: "Nama Pengantin",
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
                  controller: _nameClientController,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Column(
                children: [
                  dateTime(
                    // labelText: "Date",
                    valueText: cekTgl != true
                        ? DateFormat.yMd().format(date)
                        : DateFormat.yMd().format(tanggal),
                    valueStyle: valueStyle,
                    onPressed: () {
                      _selectDate(context, date);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Column(
                children: [
                  dateTime(
                    // labelText: "Date",
                    valueText: _timeController.text,
                    valueStyle: valueStyle,
                    onPressed: () {
                      showTime();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Tempat Agenda",
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
                  controller: _placeController,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Total Pembayaran",
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
                  controller: _totalPembayaranController,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Catatan",
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
                  controller: _noteController,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 5.h,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEventDetailScreen(
                                    paket1: paket1,
                                    paket2: paket2,
                                    paket3: paket3,
                                    paket4: paket4,
                                    paket5: paket5,
                                    namaClient: _nameClientController.text,
                                    tanggal: tanggal,
                                    jam: _timeController.text,
                                    tempat: _placeController.text,
                                    totalPembayaran:
                                        _totalPembayaranController.text,
                                    catatan: _noteController.text,
                                    eventId: eventId,
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
