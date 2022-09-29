import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/components/navbar_components.dart';
import 'package:marriage_story_app/screens/wedding_organizer/event/event_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/payment/payment_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/home/home_screen.dart';
import 'package:marriage_story_app/screens/wedding_organizer/other/other_screen.dart';

// ignore: must_be_immutable
class NavbarWeddingOrganizer extends StatefulWidget {
  int index;
  NavbarWeddingOrganizer({Key? key, required this.index}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<NavbarWeddingOrganizer> createState() =>
      _NavbarWeddingOrganizerState(index);
}

class _NavbarWeddingOrganizerState extends State<NavbarWeddingOrganizer> {
  int _selectedIndex;
  _NavbarWeddingOrganizerState(this._selectedIndex);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    EventScreen(),
    PaymentScreen(),
    OtherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavItem(
            MyFlutterApp.home,
            0,
          ),
          buildNavItem(
            MyFlutterApp.task,
            1,
          ),
          buildNavItem(
            MyFlutterApp.payment,
            2,
          ),
          buildNavItem(
            MyFlutterApp.menu,
            3,
          ), //
        ],
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: index == _selectedIndex
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 3.5,
                  color: Color(0xFFFF5596),
                )),
              )
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex
              ? const Color(0xFFFF5596)
              : Colors.grey[400],
          size: 18,
        ),
      ),
    );
  }
}
