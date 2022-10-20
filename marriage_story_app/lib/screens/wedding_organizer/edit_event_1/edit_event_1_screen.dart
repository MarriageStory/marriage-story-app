import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/edit_event_1/components/body.dart';

class EditEvent1Screen extends StatefulWidget {
  const EditEvent1Screen({Key? key}) : super(key: key);

  @override
  State<EditEvent1Screen> createState() => _EditEvent1ScreenState();
}

class _EditEvent1ScreenState extends State<EditEvent1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
