import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/components/background.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/model/user_model.dart';
import 'package:marriage_story_app/service/auth_service.dart';
import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Body extends StatefulWidget {
  static const route = '/home-client-screen';
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<SchedulesModel> _schedule;
  late Future<EventsModel> _event;
  TextEditingController _gencodeController = TextEditingController();

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
      // Get.offAllNamed(RouteName.splash);
      print("e");
      // Navigator.pushReplacementNamed(context, "/base-screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hai,",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: Color(0xffFB6C90),
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/user-profile.png",
                      height: 50,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.only(
                    top: 7.h,
                    bottom: 5.h,
                    left: 10.w,
                    right: 10.w,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFB6C90),
                        Color(0xffFB8DA0),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(1, 1),
                        color: Color(0xff000000).withOpacity(0.1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Kamu,",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Pengantin ${user.name}",
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                user.gencode == ""
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 65.w,
                            height: 5.h,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFB6C90), width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFBC0C0), width: 0.5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Masukan Kode Acara',
                                hintStyle: TextStyle(
                                  color: Color(0xff828282).withOpacity(0.40),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              controller: _gencodeController,
                            ),
                          ),
                          Container(
                            width: 20.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFFB8DA0).withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                var data = <String, dynamic>{
                                  "gencode": _gencodeController.text,
                                };

                                try {
                                  await AuthService.updateUser(user.id, data)
                                      .then((response) {
                                    if (response == true) {
                                      Get.toNamed(RouteName.navigationClient);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.green,
                                              content:
                                                  Text('Event ditemukan')));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  'Terdapat Kesalahan, coba lagi!')));
                                    }
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                  color: Color(0xFFFCFCFC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Acara",
                                style: TextStyle(
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          FutureBuilder(
                            future: _event,
                            builder:
                                (context, AsyncSnapshot<EventsModel> snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      // var event = snapshot.data?.data.first;
                                      var event = snapshot.data!.data[index];
                                      if (event.gencode == user.gencode) {
                                        return GestureDetector(
                                            onTap: () {
                                              // Navigator.pushNamed(context, DetailTask.url,
                                              //     arguments: schedule);
                                              Get.toNamed(
                                                  RouteName.detailEventClient,
                                                  arguments: event);
                                            },
                                            child: listItemEvent(event!));
                                      }
                                      return const SizedBox();
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
                                  return const Text('No Event');
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Agenda Selanjutnya",
                                style: TextStyle(
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
              ],
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
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // var event = snapshot.data?.data.first;
                        var schedule = snapshot.data!.data[index];
                        // var schedule_2 = snapshot.data?.data.first;

                        if (user.gencode == schedule.gencode) {
                          return GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, DetailTask.url,
                                //     arguments: schedule);
                                Get.toNamed(RouteName.detailTaskClient,
                                    arguments: schedule);
                              },
                              child: listItemSchedule(schedule!));
                        }
                        return const SizedBox();
                      },
                      itemCount: snapshot.data!.data.length,
                    ),
                  );
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

  Widget listItemEvent(EventModel view) {
    String tanggal = DateFormat.yMd().format(view.date);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(1, 1),
            color: Color(0xff000000).withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/poster-1.png",
              width: 25.w,
            ),
            SizedBox(
              width: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pernikahan ${view.nameClient}",
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  tanggal,
                  style: const TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    view.paket1 != "-"
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffFB6C90),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                view.paket1,
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
                    view.paket2 != "-"
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
                                view.paket2,
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
                    view.paket3 != "-"
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
                                view.paket3,
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
                    view.paket4 != "-"
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
                                view.paket4,
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
                    view.paket5 != "-"
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
                                view.paket5,
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listItemSchedule(ScheduleModel view) {
    String tanggal = DateFormat.yMd().format(view.tanggal);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: const Color(0xff000000).withOpacity(0.1),
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
                  view.namaKegiatan,
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              view.jam,
              style: const TextStyle(
                color: Color(0xffFB5490),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
