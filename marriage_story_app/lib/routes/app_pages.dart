import 'package:get/get.dart';
import 'package:marriage_story_app/screens/client/add_payment_report/add_payment_report_screen.dart';
import 'package:marriage_story_app/screens/client/detail_event/detail_event_client_screen.dart';
import 'package:marriage_story_app/screens/client/detail_task/detail_task_client_screen.dart';
import 'package:marriage_story_app/screens/client/event/event_client_screen.dart';
import 'package:marriage_story_app/screens/client/home/home_client_screen.dart';
import 'package:marriage_story_app/screens/client/payment/payment_client_screen.dart';
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
import 'package:marriage_story_app/widgets/navbar/navbar_client.dart';
import 'package:marriage_story_app/widgets/navbar/navbar_wo.dart';

part './app_routes.dart';

class AppPages {
  static const initial = RouteName.splash;

  static final pages = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.navigationClient,
      page: () => NavbarClient(
        index: 0,
      ),
    ),
    GetPage(
      name: RouteName.navigationWo,
      page: () => NavbarWeddingOrganizer(
        index: 0,
      ),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteName.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RouteName.homeWo,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteName.eventWo,
      page: () => const EventScreen(),
    ),
    GetPage(
      name: RouteName.addEvent1,
      page: () => const AddEvent1Screen(),
    ),
    GetPage(
      name: RouteName.addEvent2,
      page: () => const AddEvent2Screen(),
    ),
    GetPage(
      name: RouteName.addEvent3,
      page: () => const AddEvent3Screen(),
    ),
    // GetPage(
    //   name: RouteName.addEvent4,
    //   page: () => AddEventDetailScreen(),
    // ),
    GetPage(
      name: RouteName.detailEventWo,
      page: () => const DetailEventScreen(),
    ),
    GetPage(
      name: RouteName.taskWo,
      page: () => const TaskScreen(),
    ),
    GetPage(
      name: RouteName.addTaskWo,
      page: () => const AddTaskScreen(),
    ),
    GetPage(
      name: RouteName.detailTaskWo,
      page: () => const DetailTaskScreen(),
    ),
    GetPage(
      name: RouteName.paymentWo,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: RouteName.detailPaymentWo,
      page: () => const DetailPaymentScreen(),
    ),
    GetPage(
      name: RouteName.detailTransactionWo,
      page: () => const DetailTransactionScreen(),
    ),
    GetPage(
      name: RouteName.other,
      page: () => const OtherScreen(),
    ),
    GetPage(
      name: RouteName.homeClient,
      page: () => const HomeClientScreen(),
    ),
    GetPage(
      name: RouteName.eventClient,
      page: () => const EventClientScreen(),
    ),
    GetPage(
      name: RouteName.detailEventClient,
      page: () => const DetailEventClientScreen(),
    ),
    GetPage(
      name: RouteName.detailTaskClient,
      page: () => const DetailTaskClientScreen(),
    ),
    GetPage(
      name: RouteName.paymentClient,
      page: () => const PaymentClientScreen(),
    ),
    GetPage(
      name: RouteName.addPaymentClient,
      page: () => const AddPaymentReportScreen(),
    ),
  ];
}