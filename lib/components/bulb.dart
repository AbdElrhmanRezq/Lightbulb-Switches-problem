import 'package:flutter/material.dart';

class Bulb extends StatelessWidget {
  bool isOn = true;
  int number;
  Bulb({required this.isOn, required this.number});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.04),
          color: isOn
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
          border: Border.all(color: Colors.black, width: 1)),
      child: Center(
          child: Text(
        number.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
