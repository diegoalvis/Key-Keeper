import 'package:flutter/material.dart';

import 'add_account_bottom_sheet.dart';

class AccountListPage extends StatefulWidget {
  @override
  _AccountListPageState createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  List accounts = List.generate(20, (index) => '$index account');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("My accounts")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(accounts[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: accounts.length,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext bc) {
                    return AddAccountBottomSheet();
                  });
            }),
      ),
    );
  }
}
