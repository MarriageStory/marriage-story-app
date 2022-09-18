import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/client/detail_event/components/body.dart';

class DetailEventClientScreen extends StatefulWidget {
  const DetailEventClientScreen({Key? key}) : super(key: key);

  @override
  State<DetailEventClientScreen> createState() =>
      _DetailEventClientScreenState();
}

class _DetailEventClientScreenState extends State<DetailEventClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
