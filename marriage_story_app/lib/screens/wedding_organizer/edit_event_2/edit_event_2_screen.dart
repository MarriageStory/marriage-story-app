import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_2/components/body.dart';

class EditEvent2Screen extends StatelessWidget {
  // const EditEvent2Screen({Key? key}) : super(key: key);

  String paket1;
  String paket2;
  String paket3;
  String paket4;
  String paket5;
  String nameClient;
  int totalPembayaran;
  DateTime date;
  String tempat;
  String jam;
  String note;
  int eventId;
  EditEvent2Screen({
    Key? key,
    required this.paket1,
    required this.paket2,
    required this.paket3,
    required this.paket4,
    required this.paket5,
    required this.nameClient,
    required this.totalPembayaran,
    required this.date,
    required this.tempat,
    required this.jam,
    required this.note,
    required this.eventId,
  }) : super(key: key);

//   @override
//   State<AddEvent2Screen> createState() => _AddEvent2ScreenState();
// }

// class _AddEvent2ScreenState extends State<AddEvent2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        paket1: paket1,
        paket2: paket2,
        paket3: paket3,
        paket4: paket4,
        paket5: paket5,
        nameClient: nameClient,
        totalPembayaran: totalPembayaran,
        date: date,
        tempat: tempat,
        jam: jam,
        note: note,
        eventId: eventId,
      ),
    );
  }
}
