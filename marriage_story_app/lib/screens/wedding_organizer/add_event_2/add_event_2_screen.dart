import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_2/components/body.dart';

class AddEvent2Screen extends StatefulWidget {
  const AddEvent2Screen({Key? key}) : super(key: key);

  @override
  State<AddEvent2Screen> createState() => _AddEvent2ScreenState();
}

class _AddEvent2ScreenState extends State<AddEvent2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
