import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_event/components/background.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/event_screen.dart';
import 'package:marriage_story_app/service/schedule_service.dart';
import 'package:marriage_story_app/service/event_service.dart';
import 'package:marriage_story_app/model/schedule_model.dart';
import 'package:marriage_story_app/screens/wedding_organizer/task/task_screen.dart';
import 'package:marriage_story_app/service/payment_service.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_wo.dart';

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
    Size size = MediaQuery.of(context).size;

    return Background(
      child: ListView(
        children: [
          Container(
            // height: size.height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 20,
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
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete
                        ),
                        onPressed: () async {
                          await EventService.deleteEvent(event.id);

                          await PaymentService.deletePayment(event.id)
                              .then((value) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NavbarWeddingOrganizer(
                                index: 1,
                              );
                            }));
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                    'Acara',
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
                    width: size.width,
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "Kode 170564765",
                              //   style: TextStyle(
                              //     color: Color(0xffFFFFFF),
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Pernikahan",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                event.nameClient,
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                event.date.toString(),
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Waktu Pelaksanaan :",
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    event.time + " WIB",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Pembayaran :",
                            style: TextStyle(
                              color: Color(0xffBDBDBD),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            event.totalPembayaran.toString(),
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 170,
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
                    height: 20,
                  ),
                  Text(
                    "Catatan :",
                    style: TextStyle(
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "MC : Abdul Malik",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Fotografer : Jono Samsudin",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Semua Tugas",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        height: 100,
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
                                        if (schedule.eventId == event.id) {
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 100,
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
                                        if (schedule.status == "done" &&
                                            schedule.eventId == event.id) {
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
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
                          onPressed: () {
                            Navigator.pushNamed(context, TaskScreen.url,
                                arguments: event);
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
