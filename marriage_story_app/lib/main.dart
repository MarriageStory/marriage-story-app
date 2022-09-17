import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_1/add_event_1_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_2/add_event_2_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_3/add_event_3_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_event_detail/add_event_detail_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/add_task/add_task_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_event/detail_event_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_payment/detail_payment_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_task/detail_task_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/detail_transaction/detail_transaction_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/event_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/home/home_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/other/other_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/payment/payment_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/sign_in/sign_in_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/sign_up/sign_up_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/splash/splash_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/task/task_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/welcome/welcome_screen.dart';
import 'package:marriage_story_app/screens/client/home/home_client_screen.dart';
import 'package:marriage_story_app/screens/client/detail_event/detail_event_client_screen.dart';
import 'package:marriage_story_app/screens/client/detail_task/detail_task_client_screen.dart';
import 'package:marriage_story_app/screens/client/event/event_client_screen.dart';
import 'package:marriage_story_app/screens/client/payment/payment_client_screen.dart';
import 'package:marriage_story_app/screens/client/add_payment_report/add_payment_report_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marriage Story Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      initialRoute: '/add-payment-report-screen',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome-screen': (context) => WelcomeScreen(),
        '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => SignUpScreen(),
        '/home-screen': (context) => HomeScreen(),
        '/event-screen': (context) => EventScreen(),
        '/add-event-1-screen': (context) => AddEvent1Screen(),
        '/add-event-2-screen': (context) => AddEvent2Screen(),
        '/add-event-3-screen': (context) => AddEvent3Screen(),
        '/add-event-detail-screen': (context) => AddEventDetailScreen(),
        '/detail-event-screen': (context) => DetailEventScreen(),
        '/task-screen': (context) => TaskScreen(),
        '/add-task-screen': (context) => AddTaskScreen(),
        '/detail-task-screen': (context) => DetailTaskScreen(),
        '/payment-screen': (context) => PaymentScreen(),
        '/detail-payment-screen': (context) => DetailPaymentScreen(),
        '/detail-transaction-screen': (context) => DetailTransactionScreen(),
        '/other-screen': (context) => OtherScreen(),
        '/home-client-screen': (context) => HomeClientScreen(),
        '/detail-event-client-screen': (context) => DetailEventClientScreen(),
        '/detail-task-client-screen': (context) => DetailTaskClientScreen(),
        '/event-client-screen': (context) => EventClientScreen(),
        '/payment-client-screen': (context) => PaymentClientScreen(),
        '/add-payment-report-screen': (context) => AddPaymentReportScreen(),
      },
    );
  }
}
