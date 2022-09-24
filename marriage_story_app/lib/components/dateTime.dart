import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dateTime extends StatelessWidget {
  // final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  // final Widget child;

  const dateTime({
    Key? key,
    // required this.labelText,
    required this.valueText,
    required this.valueStyle,
    required this.onPressed,
  }) : super(key: key);

  // const DateDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff828282)),
          ),
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              valueText,
              style: valueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
