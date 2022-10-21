import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_task/components/background.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../widgets/check_box.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isSelected = false;
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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 5.h,
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
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () => Get.back(),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Get.toNamed(RouteName.editTaskWo, arguments: schedule);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        await ScheduleService.deleteSchedule(schedule.id).then(
                          (value) {
                            Get.toNamed(RouteName.navigationWo);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Column(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = true;
                          });
                        },
                      ),
                      const Text(
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
                    if (schedule.status == "pending") {
                      var body = <String, dynamic>{
                        "nama_kegiatan": schedule.namaKegiatan,
                        "detail_kegiatan": schedule.detailKegiatan,
                        "tanggal": schedule.tanggal.toString(),
                        "tempat": schedule.tempat,
                        "jam": schedule.jam,
                        'status': "done",
                      };

                      await ScheduleService.updateSchedule(schedule.id, body)
                          .then(
                        (value) {
                          Get.toNamed(RouteName.navigationWo);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Agenda telah selesai')));
                        },
                      );
                    } else {
                      var body = <String, dynamic>{
                        "nama_kegiatan": schedule.namaKegiatan,
                        "detail_kegiatan": schedule.detailKegiatan,
                        "tanggal": schedule.tanggal.toString(),
                        "tempat": schedule.tempat,
                        "jam": schedule.jam,
                        'status': "pending",
                      };

                      await ScheduleService.updateSchedule(schedule.id, body)
                          .then(
                        (value) {
                          Get.toNamed(RouteName.navigationWo);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Agenda belum selesai')));
                        },
                      );
                    }
                  },
                ),
                Container(
                  width: 65.w,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(80, 32, 52, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          schedule.jam,
                          style: const TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          tanggal,
                          style: const TextStyle(
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
            LabeledSwitch(
              label: 'Selesai',
              padding: const EdgeInsets.symmetric(horizontal: 10),
              value: _isSelected,
              onChanged: (bool newValue) {
                setState(
                  () {
                    _isSelected = newValue;
                  },
                );
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            const Text(
              "Nama Tugas :",
              style: TextStyle(
                color: Color(0xffBDBDBD),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              schedule.namaKegiatan,
              style: const TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Text(
              "Tempat :",
              style: TextStyle(
                color: Color(0xffBDBDBD),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              schedule.tempat,
              style: const TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Text(
              "Detail Tugas :",
              style: TextStyle(
                color: Color(0xffBDBDBD),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              schedule.detailKegiatan,
              style: const TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
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
