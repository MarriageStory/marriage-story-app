import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/welcome/components/background.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/model/user_model.dart';
import 'package:marriage_story_app/service/auth_service.dart';
import 'package:marriage_story_app/screens/client/home/home_client_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_event/detail_event_screen.dart';

class Body extends StatefulWidget {
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
      Navigator.pushReplacementNamed(context, "/base-screen");
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
                        "Wedding Organizer",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
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
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 30, 100, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Acara",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            FutureBuilder(
                              future: _event,
                              builder: (context,
                                  AsyncSnapshot<EventsModel> snapshot) {
                                var state = snapshot.connectionState;
                                if (state != ConnectionState.done) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    int totalAcara = snapshot.data!.data.length;
                                    return Text(
                                      totalAcara.toString(),
                                      style: TextStyle(
                                        color: Color(0xffFB6C90),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
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
                          ],
                        ),
                      ),
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
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 30, 100, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Agenda",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
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
                                    int totalAgenda =
                                        snapshot.data!.data.length;
                                    return Text(
                                      totalAgenda.toString(),
                                      style: TextStyle(
                                        color: Color(0xffFB6C90),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
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
                          ],
                        ),
                      ),
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
                    )
                  ],
                ),
                SizedBox(
                  height: 52,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Semua Acara",
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
                              return InkWell(
                                  onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailEventScreen.url,
                                      arguments: event);
                                  },
                                  child: listItem(event!));

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
          ),
        ),
      ),
    );
  }

  Widget listItem(EventModel view) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(
              "assets/images/poster-1.png",
              height: 95,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  view.nameClient,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  view.date.toIso8601String(),
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
                          "Pre-wedding",
                          style: TextStyle(
                            color: Color(0xffFB6C90),
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
                          color: Color(0xffFB6C90),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Engagement",
                          style: TextStyle(
                            color: Color(0xffFB6C90),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
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
                          "Akad",
                          style: TextStyle(
                            color: Color(0xffFB6C90),
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
                          color: Color(0xffFB6C90),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Panggih",
                          style: TextStyle(
                            color: Color(0xffFB6C90),
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
                          color: Color(0xffFB6C90),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Resepsi",
                          style: TextStyle(
                            color: Color(0xffFB6C90),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
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
    );
  }
}
