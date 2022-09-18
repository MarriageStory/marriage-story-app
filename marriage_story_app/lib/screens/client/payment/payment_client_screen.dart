import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/client/payment/components/body.dart';

class PaymentClientScreen extends StatefulWidget {
  const PaymentClientScreen({Key? key}) : super(key: key);

  @override
  State<PaymentClientScreen> createState() => _PaymentClientScreenState();
}

class _PaymentClientScreenState extends State<PaymentClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
