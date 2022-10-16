import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/client/event/components/background.dart';
import 'package:marriage_story_app/screens/client/detail_task/detail_task_client_screen.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/model/user_model.dart';
import 'package:marriage_story_app/service/auth_service.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  static const routeName = '/event-client-screen';
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<SchedulesModel> _schedule;
  late Future<EventsModel> _event;

  UserModel user = UserModel(
      id: 0,
      name: "",
      email: "",
      emailVerifiedAt: DateTime.now(),
      roleName: "",
      gencode: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  void initState() {
    super.initState();
    getUserProfile();

    try {
      _schedule = ScheduleService.getAllSchedules();
      _event = EventService.getAllEvent();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserProfile() async {
    try {
      var data = await AuthService.authUserProfile();

      setState(() {
        user = data;
      });
    } catch (e) {
      Get.offAllNamed(RouteName.splash);
      // Navigator.pushReplacementNamed(context, "/base-screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 435,
            width: double.infinity,
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
              padding: const EdgeInsets.only(
                top: 64,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Agneda",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Acara',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 3,
                  //         horizontal: 6,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.transparent,
                  //         borderRadius: BorderRadius.circular(5),
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           "Pre-wedding",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 11,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 3,
                  //         horizontal: 6,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.transparent,
                  //         borderRadius: BorderRadius.circular(5),
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           "Engagement",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 11,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 3,
                  //         horizontal: 6,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.transparent,
                  //         borderRadius: BorderRadius.circular(5),
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           "Akad",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 11,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 3,
                  //         horizontal: 6,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.transparent,
                  //         borderRadius: BorderRadius.circular(5),
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           "Panggih",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 11,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 3,
                  //         horizontal: 6,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.transparent,
                  //         borderRadius: BorderRadius.circular(5),
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           "Resepsi",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 11,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 60,
                  // ),
                  FutureBuilder(
                    future: _event,
                    builder: (context, AsyncSnapshot<EventsModel> snapshot) {
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
                              var event = snapshot.data!.data[index];
                              if (user.gencode == event.gencode) {
                                return InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context, DetailTask.url,
                                      //     arguments: schedule);
                                    },
                                    child: listItemEvent(event!));
                              }
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
                          return Text('No Event');
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       "Kode 12312314",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              "Agenda Selanjutnya",
              style: TextStyle(
                color: Color(0xffBDBDBD),
                fontSize: 14,
                fontWeight: FontWeight.w500,
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

                      if (schedule.gencode == user.gencode) {
                        return InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.detailTaskClient,
                                  arguments: schedule);
                            },
                            child: listItemSchedule(schedule!));
                      }
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
        ],
      ),
    );
  }

  Widget listItemEvent(EventModel view) {
    String tanggal = DateFormat.yMd().format(view.date);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  view.paket1,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  view.paket2,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  view.paket3,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  view.paket4,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  view.paket5,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Pernikahan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 3),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.20),
                        )
                      ]),
                ),
                Text(
                  view.nameClient,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 3),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.20),
                        )
                      ]),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  tanggal,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 3),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.20),
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget listItemSchedule(ScheduleModel view) {
    String tanggal = DateFormat.yMd().format(view.tanggal);
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
              color: Color(0xff000000).withOpacity(0.25),
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
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    view.namaKegiatan,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                view.jam,
                style: TextStyle(
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
}
