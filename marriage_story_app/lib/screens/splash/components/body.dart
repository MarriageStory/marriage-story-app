import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_app/screens/splash/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/logo-white.png",
                height: size.height * 0.22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
