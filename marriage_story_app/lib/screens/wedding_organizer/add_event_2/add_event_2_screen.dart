import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_2/components/body.dart';

class AddEvent2Screen extends StatelessWidget {
  // const AddEvent2Screen({Key? key}) : super(key: key);
  final String paket1;
  final String paket2;
  final String paket3;
  final String paket4;
  final String paket5;
  const AddEvent2Screen(
      {Key? key,
      required this.paket1,
      required this.paket2,
      required this.paket3,
      required this.paket4,
      required this.paket5})
      : super(key: key);

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
      ),
    );
  }
}
