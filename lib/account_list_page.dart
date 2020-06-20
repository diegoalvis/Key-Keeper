import 'package:flutter/material.dart';

class AccountListPage extends StatefulWidget {
  @override
  _AccountListPageState createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  List accounts = List.generate(20, (index) => '$index account');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My accounts")),
      body: Container(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => Text(accounts[index]),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: accounts.length,
        ),
      ),
    );
  }
}
