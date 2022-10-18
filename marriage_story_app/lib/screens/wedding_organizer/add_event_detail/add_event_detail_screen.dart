import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_detail/components/body.dart';

class AddEventDetailScreen extends StatelessWidget {
  final String paket1;
  final String paket2;
  final String paket3;
  final String paket4;
  final String paket5;
  final String namaClient;
  final String tanggal;
  final String jam;
  final String tempat;
  final String totalPembayaran;
  final String catatan;
  const AddEventDetailScreen(
      {Key? key,
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
      required this.catatan})
      : super(key: key);

//   @override
//   State<AddEventDetailScreen> createState() => _AddEventDetailScreenState();
// }

// class _AddEventDetailScreenState extends State<AddEventDetailScreen> {
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
          catatan: this.catatan),
    );
  }
}
