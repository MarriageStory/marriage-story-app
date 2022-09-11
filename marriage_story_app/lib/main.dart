import 'package:flutter/material.dart';
import 'package:marriage_story_app/screens/add_event_1/add_event_1_screen.dart';
import 'package:marriage_story_app/screens/add_event_2/add_event_2_screen.dart';
import 'package:marriage_story_app/screens/add_event_3/add_event_3_screen.dart';
import 'package:marriage_story_app/screens/event/event_screen.dart';
import 'package:marriage_story_app/screens/home/home_screen.dart';
import 'package:marriage_story_app/screens/sign_in/sign_in_screen.dart';
import 'package:marriage_story_app/screens/sign_up/sign_up_screen.dart';
import 'package:marriage_story_app/screens/splash/splash_screen.dart';
import 'package:marriage_story_app/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marriage Story Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      initialRoute: '/add-event-2-screen',
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
      },
    );
  }
}
