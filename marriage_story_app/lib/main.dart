import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:marriage_story_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenTypex) {
        return GetMaterialApp(
          title: 'Marriage Story Apps',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Nunito',
          ),
          // initialRoute: AppPages.initial,
          initialRoute: AppPages.initial,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
