import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_detail/components/body.dart';

class AddEventDetailScreen extends StatelessWidget {
  final String namaClient;
  final String tanggal;
  final String jam;
  final String tempat;
  final String totalPembayaran;
  final String catatan;
  const AddEventDetailScreen(
      {Key? key,
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
          namaClient: this.namaClient,
          tanggal: this.tanggal,
          jam: this.jam,
          tempat: this.tempat,
          totalPembayaran: this.totalPembayaran,
          catatan: this.catatan),
    );
  }
}
