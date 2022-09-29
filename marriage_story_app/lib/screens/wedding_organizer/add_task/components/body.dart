import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_task/components/background.dart';
import 'package:marriage_story_app/components/dateTime.dart';
import 'package:marriage_story_app/screens/wedding_organizer/home/home_screen.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_wo.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //controller
  TextEditingController _nameTaskController = TextEditingController();
  TextEditingController _detailTaskController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  //pengecekan date & time
  bool cekJam = false;
  bool cekTgl = false;
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

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
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
                'Agenda',
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
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Tugas",
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
                  controller: _nameTaskController,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.transparent,
              //   ),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       hintText: "Tanggal",
              //       hintStyle: const TextStyle(
              //         color: Color(0xff828282),
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14,
              //       ),
              //     ),
              //     style: const TextStyle(
              //       color: Color(0xff828282),
              //       fontWeight: FontWeight.w500,
              //       fontSize: 14,
              //     ),
              //     controller: _dateController,
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              Container(
                // margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
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
                height: 16,
              ),
              Container(
                // margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                child: Column(children: [
                  dateTime(
                    // labelText: "Date",
                    valueText: cekJam != false ? _timeController.text : "Waktu",
                    valueStyle: valueStyle,
                    onPressed: () {
                      showTime();
                    },
                  ),
                ]),
              ),
              // SizedBox(
              //   height: 16,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.transparent,
              //   ),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       hintText: "Waktu",
              //       hintStyle: const TextStyle(
              //         color: Color(0xff828282),
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14,
              //       ),
              //     ),
              //     style: const TextStyle(
              //       color: Color(0xff828282),
              //       fontWeight: FontWeight.w500,
              //       fontSize: 14,
              //     ),
              //     controller: _timeController,
              //   ),
              // ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tempat",
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
                    hintText: "Detail Tugas",
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
                  controller: _detailTaskController,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 180,
                    height: 45,
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
                        // Map<String, dynamic> body = {
                        //   'nama_kegiatan': _nameTaskController.text,
                        //   'detail_kegiatan': _detailTaskController.text,
                        //   'tanggal': _dateController.text,
                        //   'tempat': _placeController.text,
                        //   'jam': _timeController.text,
                        //   'status': "pending",
                        // };

                        var body = <String, dynamic>{
                          'nama_kegiatan': _nameTaskController.text,
                          'detail_kegiatan': _detailTaskController.text,
                          'tanggal': _dateController.text,
                          'tempat': _placeController.text,
                          'jam': _timeController.text,
                          'status': "pending",
                          'event_id': event.id,
                        };

                        await ScheduleService.createNewSchedule(body)
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavbarWeddingOrganizer(
                                index: 0,
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'You have successfully create a scedule')));
                        });
                      },
                      child: const Text(
                        "Tambah",
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
