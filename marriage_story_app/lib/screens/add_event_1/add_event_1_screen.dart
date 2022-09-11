import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/add_event_1/components/body.dart';

class AddEvent1Screen extends StatefulWidget {
  const AddEvent1Screen({Key? key}) : super(key: key);

  @override
  State<AddEvent1Screen> createState() => _AddEvent1ScreenState();
}

class _AddEvent1ScreenState extends State<AddEvent1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
