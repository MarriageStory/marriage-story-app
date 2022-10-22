import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/task/components/background.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<SchedulesModel> _schedule;
  late Future<EventsModel> _event;
  bool punyaData = false;
  int semuaAgenda = 1;
  // int count = 1;

  @override
  void initState() {
    super.initState();

    try {
      _schedule = ScheduleService.getAllSchedules();
      _event = EventService.getAllEvent();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    int agendaSelesai = 0;
    int agendaTotal = 0;
    Size size = MediaQuery.of(context).size;
    final eventDetail =
        ModalRoute.of(context)!.settings.arguments as EventModel;
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFB6C90),
                  Color(0xffFB8DA0),
                ],
              ),
            ),
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
                    color: Color(0xffFFFFFF),
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
                          "Semua",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Agenda',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 43.w,
                        height: 15.h,
                        decoration: BoxDecoration(
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
                                        padding: const EdgeInsets.all(0),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          // var event = snapshot.data?.data.first;
                                          var schedule =
                                              snapshot.data!.data[index];
                                          if (schedule.eventId ==
                                              eventDetail.id) {
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
                        height: 15.h,
                        decoration: BoxDecoration(
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
                                        padding: const EdgeInsets.all(0),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          // var event = snapshot.data?.data.first;
                                          var schedule =
                                              snapshot.data!.data[index];
                                          if (schedule.status == "done" &&
                                              schedule.eventId ==
                                                  eventDetail.id) {
                                            agendaSelesai++;
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
                    height: 1.h,
                  ),
                  Container(
                    height: 5.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF).withOpacity(0.30),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.addTaskWo,
                            arguments: eventDetail);
                      },
                      child: const Text(
                        "Tambah Agenda",
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
            ),
          ),
          FutureBuilder(
            future: _schedule,
            builder: (context, AsyncSnapshot<SchedulesModel> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data!.data.length > 0) {
                    return SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var schedule = snapshot.data!.data[index];

                          if (eventDetail.id == schedule.eventId) {
                            punyaData = true;
                            return GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, DetailTaskScreen.url,
                                  //     arguments: schedule);
                                  Get.toNamed(RouteName.detailTaskWo,
                                      arguments: schedule);
                                },
                                child:
                                    listItemSchedule(eventDetail, schedule!));
                          }
                          if (punyaData == false &&
                              semuaAgenda == snapshot.data!.data.length) {
                            return Center(
                              child: Text(
                                "belum ada jadwal",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            );
                          }
                          semuaAgenda++;
                          return SizedBox();
                        },
                        itemCount: snapshot.data!.data.length,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "belum ada jadwal",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
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
        ],
      ),
    );
  }

  Widget listItemSchedule(EventModel viewEvent, ScheduleModel viewSchedule) {
    String tanggal = DateFormat.yMd().format(viewSchedule.tanggal);
    if (viewEvent.id == viewSchedule.eventId) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffFFFFFF),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0xff000000).withOpacity(0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tanggal,
                      style: const TextStyle(
                        color: Color(0xffBDBDBD),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      viewSchedule.namaKegiatan,
                      style: const TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  viewSchedule.jam,
                  style: const TextStyle(
                    color: Color(0xffFB5490),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const Text("");
  }
}
