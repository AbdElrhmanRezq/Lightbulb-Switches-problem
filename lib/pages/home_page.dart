import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController numController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: width * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(hintText: "Number of bulbs"),
                    controller: numController),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Make sure to input a number bigger than 2")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "view-page",
                          arguments: int.parse(numController.text.trim()));
                    },
                    child: Text("Start")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
