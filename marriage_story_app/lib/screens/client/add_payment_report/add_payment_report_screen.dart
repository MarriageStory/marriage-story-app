import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/client/add_payment_report/components/body.dart';

class AddPaymentReportScreen extends StatefulWidget {
  const AddPaymentReportScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentReportScreen> createState() => _AddPaymentReportScreenState();
}

class _AddPaymentReportScreenState extends State<AddPaymentReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
