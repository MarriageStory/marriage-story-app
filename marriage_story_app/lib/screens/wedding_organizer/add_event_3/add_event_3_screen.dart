import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_3/components/body.dart';

class AddEvent3Screen extends StatefulWidget {
  const AddEvent3Screen({Key? key}) : super(key: key);

  @override
  State<AddEvent3Screen> createState() => _AddEvent3ScreenState();
}

class _AddEvent3ScreenState extends State<AddEvent3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
