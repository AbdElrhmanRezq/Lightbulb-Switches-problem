import 'package:flutter/material.dart';
import 'package:lightbulb_switch_problem/pages/home_page.dart';
import 'package:lightbulb_switch_problem/pages/view_page.dart';
import 'package:lightbulb_switch_problem/themes/light_theme.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        ViewPage.id: (context) => ViewPage()
      },
    );
  }
}
