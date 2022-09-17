import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/client/detail_task/components/body.dart';

class DetailTaskClientScreen extends StatefulWidget {
  const DetailTaskClientScreen({Key? key}) : super(key: key);

  @override
  State<DetailTaskClientScreen> createState() => _DetailTaskClientScreenState();
}

class _DetailTaskClientScreenState extends State<DetailTaskClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
