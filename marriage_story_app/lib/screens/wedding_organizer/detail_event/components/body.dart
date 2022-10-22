import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/components/formatAngka.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<SchedulesModel> _schedule;

  @override
  void initState() {
    super.initState();

    try {
      _schedule = ScheduleService.getAllSchedules();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    int agendaSelesai = 0;
    int agendaTotal = 0;
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    String tanggal = DateFormat.yMd().format(event.date);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 5.h,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // Get.toNamed(RouteName.editEvent2);
                              Get.toNamed(RouteName.editEvent1,
                                  arguments: event);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await EventService.deleteEvent(event.id).then(
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
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    height: 5.h,
                  ),
                  Container(
                    width: 100.w,
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
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Kode ${event.gencode}",
                            style: const TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Pernikahan",
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    event.nameClient,
                                    style: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      event.paket1 != "-"
                          ? Container(
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
                                  event.paket1,
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: 1.w,
                      ),
                      event.paket2 != "-"
                          ? Container(
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
                                  event.paket2,
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: 1.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      event.paket3 != "-"
                          ? Container(
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
                                  event.paket3,
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 4,
                      ),
                      event.paket4 != "-"
                          ? Container(
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
                                  event.paket4,
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: 1.w,
                      ),
                      event.paket5 != "-"
                          ? Container(
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
                                  event.paket5,
                                  style: const TextStyle(
                                    color: Color(0xffFB6C90),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                    "Waktu Pelaksanaan :",
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "${event.time} WIB",
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Pembayaran :",
                            style: TextStyle(
                              color: Color(0xffBDBDBD),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            formatAngka.convertToIdr(
                                int.parse(event.totalPembayaran.toString()), 2),
                            style: const TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40.w,
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
                          onPressed: () {},
                          child: const Text(
                            "Lihat  Pembayaran",
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
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                    "Catatan :",
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    event.note,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "Semua Tugas",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 43.w,
                        height: 13.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: _schedule,
                              builder: (context,
                                  AsyncSnapshot<SchedulesModel> snapshot) {
                                var state = snapshot.connectionState;
                                if (state != ConnectionState.done) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.data.length > 0) {
                                      return ListView.builder(
                                        padding: const EdgeInsets.all(0),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          var schedule =
                                              snapshot.data!.data[index];
                                          if (schedule.eventId == event.id) {
                                            agendaTotal++;
                                          }
                                          if (count ==
                                              snapshot.data!.data.length) {
                                            count = 1;
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  agendaTotal.toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xffFB5490),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          count++;
                                          return SizedBox();
                                        },
                                        itemCount: snapshot.data!.data.length,
                                      );
                                    } else {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            agendaTotal.toString(),
                                            style: const TextStyle(
                                              color: Color(0xffFB5490),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                      ),
                                    );
                                  } else {
                                    return const Text('No Schedule');
                                  }
                                }
                              },
                            ),
                            const Text(
                              "Jumlah Agenda",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 43.w,
                        height: 13.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: _schedule,
                              builder: (context,
                                  AsyncSnapshot<SchedulesModel> snapshot) {
                                var state = snapshot.connectionState;
                                if (state != ConnectionState.done) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.data.length > 0) {
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          // var event = snapshot.data?.data.first;
                                          var schedule =
                                              snapshot.data!.data[index];
                                          if (schedule.status == "done" &&
                                              schedule.eventId == event.id) {
                                            agendaSelesai++;
                                          }
                                          if (count ==
                                              snapshot.data!.data.length) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  agendaSelesai.toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xffFB5490),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          count++;
                                          return const SizedBox();
                                        },
                                        itemCount: snapshot.data!.data.length,
                                      );
                                    } else {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            agendaSelesai.toString(),
                                            style: const TextStyle(
                                              color: Color(0xffFB5490),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                      ),
                                    );
                                  } else {
                                    return const Text('No Schedule');
                                  }
                                }
                              },
                            ),
                            const Text(
                              "Agenda Selesai",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
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
                              Get.toNamed(RouteName.taskWo, arguments: event);
                              // Navigator.pushNamed(context, TaskScreen.url,
                              //     arguments: event);
                            },
                            child: const Text(
                              "Lihat Agenda",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
