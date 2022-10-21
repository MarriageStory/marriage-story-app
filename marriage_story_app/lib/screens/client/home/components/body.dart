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
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 64,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hai,",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          user.name,
                          style: TextStyle(
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
                  height: 64,
                ),
                Container(
                  height: 125,
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
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
                        color: Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Kamu,",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Pengantin " + user.name,
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                user.gencode == ""
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 224,
                            height: 45,
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
                                      color: Color(0xFFFBC0C0), width: 0.1),
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
                            width: 96,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFFB8DA0),
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
                              child: Text(
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
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                            height: 10,
                          ),
                          FutureBuilder(
                            future: _event,
                            builder:
                                (context, AsyncSnapshot<EventsModel> snapshot) {
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
                                      if (event.gencode == user.gencode) {
                                        return InkWell(
                                            onTap: () {
                                              // Navigator.pushNamed(context, DetailTask.url,
                                              //     arguments: schedule);
                                              Get.toNamed(
                                                  RouteName.detailEventClient,
                                                  arguments: event);
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                            height: 10,
                          ),
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
                                      var schedule = snapshot.data!.data[index];
                                      // var schedule_2 = snapshot.data?.data.first;

                                      if (user.gencode == schedule.gencode) {
                                        return InkWell(
                                            onTap: () {
                                              // Navigator.pushNamed(context, DetailTask.url,
                                              //     arguments: schedule);
                                              Get.toNamed(
                                                  RouteName.detailTaskClient,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listItemEvent(EventModel view) {
    String tanggal = DateFormat.yMd().format(view.date);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(1, 1),
            color: Color(0xff000000).withOpacity(0.25),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/poster-1.png",
              height: 95,
              width: 90,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pernikahan " + view.nameClient,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  tanggal,
                  style: TextStyle(
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    view.paket1 != "-"
                        ?
                        Container(
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
                                view.paket1,
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    view.paket2 != "-"
                        ?
                        Container(
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
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    view.paket3 != "-"
                        ?
                        Container(
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
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    view.paket4 != "-"
                        ?
                        Container(
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
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 4,
                    ),
                    view.paket5 != "-"
                        ?
                        Container(
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
                                style: TextStyle(
                                  color: Color(0xffFB6C90),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
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
    return Column(
      children: [
        Container(
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
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
