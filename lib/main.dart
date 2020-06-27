import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:keykeeper/ui/account_list/account_list_page.dart';
import 'package:keykeeper/ui/welcome/welcome_page.dart';

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
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: currentBrightness == Brightness.dark ? [Color(0xFF0C1C3D), Colors.black] : [Colors.white, Colors.grey[300]],
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
          primaryColor: Colors.lightBlue,
          buttonColor: Colors.lightBlue,
          accentColor: Colors.yellow,
          dividerColor: Colors.transparent,
        ),
        home: WelcomePage(),
      ),
    );
  }
}
