import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_detail/components/body.dart';

class EditEventDetailScreen extends StatelessWidget {
  final String paket1;
  final String paket2;
  final String paket3;
  final String paket4;
  final String paket5;
  final String namaClient;
  final DateTime tanggal;
  final String jam;
  final String tempat;
  final String totalPembayaran;
  final String catatan;
  final int eventId;
  const EditEventDetailScreen({
    Key? key,
    required this.paket1,
    required this.paket2,
    required this.paket3,
    required this.paket4,
    required this.paket5,
    required this.namaClient,
    required this.tanggal,
    required this.jam,
    required this.tempat,
    required this.totalPembayaran,
    required this.catatan,
    required this.eventId,
  }) : super(key: key);

//   @override
//   State<EditEventDetailScreen> createState() => _EditEventDetailScreenState();
// }

// class _EditEventDetailScreenState extends State<EditEventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        paket1: paket1,
        paket2: paket2,
        paket3: paket3,
        paket4: paket4,
        paket5: paket5,
        namaClient: this.namaClient,
        tanggal: this.tanggal,
        jam: this.jam,
        tempat: this.tempat,
        totalPembayaran: this.totalPembayaran,
        catatan: this.catatan,
        eventId: this.eventId,
      ),
    );
  }
}
