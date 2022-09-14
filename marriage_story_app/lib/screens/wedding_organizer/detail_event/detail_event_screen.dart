import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_event/components/body.dart';

class DetailEventScreen extends StatefulWidget {
  const DetailEventScreen({Key? key}) : super(key: key);

  @override
  State<DetailEventScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<DetailEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
