import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lightbulb_switch_problem/components/bulb.dart';

import '../models/switch.dart';

class ViewPage extends StatefulWidget {
  static const String id = "view-page";
  late Witch switcher;
  String pattern = "";
  List<bool> conditions = [];
  int counter = 0;
  bool finished = false;

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late Timer _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int args = ModalRoute.of(context)!.settings.arguments as int;
    widget.switcher = Witch(number: args);
    widget.pattern = widget.switcher.crushLights();
    for (int i = 0; i < args; i++) {
      widget.conditions.add(true);
    }
    _timer = Timer.periodic(Duration(milliseconds: 1500), (Timer timer) {
      if (widget.counter < widget.pattern.length) {
        setState(() {
          widget.conditions[int.parse(widget.pattern[widget.counter]) - 1] =
              !widget.conditions[int.parse(widget.pattern[widget.counter]) - 1];
          widget.counter++;
        });
      } else {
        setState(() {
          widget.finished = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.15,
                  width: width * (widget.conditions.length - 0.5) / 10,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 138, 139, 135),
                      borderRadius: BorderRadius.circular(4)),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    shrinkWrap:
                        true, // Enable shrinkWrap to make the ListView take the minimum size
                    physics:
                        NeverScrollableScrollPhysics(), // Disable scrolling
                    itemCount: widget.conditions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          // Center widget added here
                          child: Bulb(
                            isOn: widget.conditions[index],
                            number: index + 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Current counter: " + widget.counter.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
            )
          ],
        )),
      ),
    );
  }
}
