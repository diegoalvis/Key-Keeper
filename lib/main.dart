import 'package:flutter/material.dart';
import 'package:keykeeper/account_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF0C1C3D),  Colors.black],
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
        home: AccountListPage(),
      ),
    );
  }
}
