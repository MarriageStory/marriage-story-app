import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/client/event/components/body.dart';

class EventClientScreen extends StatefulWidget {
  const EventClientScreen({Key? key}) : super(key: key);

  @override
  State<EventClientScreen> createState() => _EventClientScreenState();
}

class _EventClientScreenState extends State<EventClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}