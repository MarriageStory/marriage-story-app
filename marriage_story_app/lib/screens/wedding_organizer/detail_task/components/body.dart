import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_task/components/background.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/event_screen.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final schedule =
        ModalRoute.of(context)!.settings.arguments as ScheduleModel;
    String tanggal = DateFormat.yMd().format(schedule.tanggal);
    bool isChecked = false;
    if (schedule.status == "done") {
      isChecked = true;
    }
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () => Get.back(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  "Detail",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Agenda",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = true;
                              });
                            },
                          ),
                          Text(
                            "Selesai",
                            style: TextStyle(
                              color: Color(0xffFB6C90),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      onTap: () async {
                        // Map<String, dynamic> body = {
                        //   'nama_kegiatan': _nameTaskController.text,
                        //   'detail_kegiatan': _detailTaskController.text,
                        //   'tanggal': _dateController.text,
                        //   'tempat': _placeController.text,
                        //   'jam': _timeController.text,
                        //   'status': "pending",
                        // };

                        var body = <String, dynamic>{
                          'status': "done",
                        };

                        await ScheduleService.updateSchedule(schedule.id, body)
                            .then(
                          (value) {
                            Get.toNamed(RouteName.navigationWo);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => EventScreen()),
                            // );
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'You have successfully update a scedule')));
                          },
                        );
                      },
                    ),
                    Container(
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(80, 32, 52, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              schedule.jam,
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 4,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 65,
                ),
                Text(
                  "Nama Tugas :",
                  style: TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  schedule.namaKegiatan,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Tempat :",
                  style: TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  schedule.tempat,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Detail Tugas :",
                  style: TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  schedule.detailKegiatan,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Color(0xffFB6C90);
  }
}
