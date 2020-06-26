import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:keykeeper/welcome/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentBrightness = SchedulerBinding.instance.window.platformBrightness;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: currentBrightness == Brightness.dark ? Alignment.topRight : Alignment.bottomLeft,
          end: currentBrightness == Brightness.dark ? Alignment.bottomLeft : Alignment.topRight,
          colors: currentBrightness == Brightness.dark ? [Color(0xFF0C1C3D), Colors.black] : [Colors.white, Colors.grey[500]],
        ),
      ),
      child: MaterialApp(
        title: 'Key Keeper',
        darkTheme: ThemeData.dark().copyWith(
          buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
          accentColor: Colors.tealAccent,
          primaryColorDark: Colors.blue,
          scaffoldBackgroundColor: Colors.transparent,
          primaryColor: Colors.blue,
          dividerColor: Colors.transparent,
          cardColor: Color(0xFF0C1C3D),
          dialogBackgroundColor: Color(0xFF0C1C3D),
          indicatorColor: Colors.blue,
          cursorColor: Colors.blue,
        ),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          primaryColor: Color(0xfff3c623),
          buttonColor: Colors.blue,
          accentColor: Color(0xfff3c623),
        ),
        home: WelcomePage(),
      ),
    );
  }
}
