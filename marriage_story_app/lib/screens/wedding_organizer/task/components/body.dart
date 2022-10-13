import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/task/components/background.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_task/detail_task_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_task/add_task_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<SchedulesModel> _schedule;
  late Future<EventsModel> _event;

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
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
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
              padding: const EdgeInsets.only(
                top: 64,
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
                    color: Color(0xffFFFFFF),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        height: 100,
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
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        // var event = snapshot.data?.data.first;
                                        var schedule =
                                            snapshot.data!.data[index];
                                        if (schedule.eventId ==
                                            eventDetail.id) {
                                          agendaTotal++;
                                        } else if (count ==
                                            snapshot.data!.data.length) {
                                          count = 1;
                                          return Container(
                                            child: Row(children: [
                                              SizedBox(
                                                width: 75,
                                              ),
                                              Text(
                                                agendaTotal.toString(),
                                                style: TextStyle(
                                                  color: Color(0xffFB5490),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ]),
                                          );
                                        }
                                        count++;
                                        return SizedBox();
                                      },
                                      itemCount: snapshot.data!.data.length,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                      ),
                                    );
                                  } else {
                                    return Text('No Schedule');
                                  }
                                }
                              },
                            ),
                            Text(
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
                        width: 160,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   "3",
                            //   style: TextStyle(
                            //     color: Color(0xffFB5490),
                            //     fontWeight: FontWeight.w700,
                            //     fontSize: 20,
                            //   ),
                            // ),
                            FutureBuilder(
                              future: _schedule,
                              builder: (context,
                                  AsyncSnapshot<SchedulesModel> snapshot) {
                                var state = snapshot.connectionState;
                                if (state != ConnectionState.done) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
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
                                        } else if (count ==
                                            snapshot.data!.data.length) {
                                          return Container(
                                            child: Row(children: [
                                              SizedBox(
                                                width: 75,
                                              ),
                                              Text(
                                                agendaSelesai.toString(),
                                                style: TextStyle(
                                                  color: Color(0xffFB5490),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ]),
                                          );
                                        }
                                        count++;
                                        return SizedBox();
                                      },
                                      itemCount: snapshot.data!.data.length,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                      ),
                                    );
                                  } else {
                                    return Text('No Schedule');
                                  }
                                }
                              },
                            ),
                            Text(
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
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF).withOpacity(0.30),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AddTaskScreen.url,
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
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: _schedule,
            builder: (context, AsyncSnapshot<SchedulesModel> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var schedule = snapshot.data!.data[index];

                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, DetailTaskScreen.url,
                                arguments: schedule);
                          },
                          child: listItemSchedule(eventDetail, schedule!));
                    },
                    itemCount: snapshot.data!.data.length,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else {
                  return Text('No Schedule');
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget listItemSchedule(EventModel viewEvent, ScheduleModel viewSchedule) {
    if (viewEvent.id == viewSchedule.eventId) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewSchedule.tanggal.toIso8601String(),
                        style: TextStyle(
                          color: Color(0xffBDBDBD),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        viewSchedule.namaKegiatan,
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    viewSchedule.jam,
                    style: TextStyle(
                      color: Color(0xffFB5490),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffFFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0xff000000).withOpacity(0.25),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Text("");
  }
}
