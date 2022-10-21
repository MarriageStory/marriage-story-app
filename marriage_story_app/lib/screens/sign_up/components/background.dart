import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/sign-in-1.png",
              height: size.height * 0.25,
            ),
          ),
          Positioned(
            top: 70,
            left: 228,
            child: Image.asset(
              "assets/images/sign-in-2.png",
              height: size.height * 0.13,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
