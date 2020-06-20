import 'package:flutter/material.dart';
import 'package:keykeeper/account_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Keeper',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Color(0xfff3c623),
        buttonColor: Colors.blue,
        accentColor: Color(0xfff3c623),
      ),
      home: AccountListPage(),
    );
  }
}
