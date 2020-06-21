import 'package:flutter/material.dart';
import 'package:keykeeper/storage/account_model.dart';
import 'package:keykeeper/storage/preferences_manager.dart';

import 'add_account_bottom_sheet.dart';

class AccountListPage extends StatefulWidget {
  @override
  _AccountListPageState createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  List<AccountModel> accountList;
  PreferencesManager _preferencesManager = PreferencesManager();

  @override
  void initState() {
    loadAccountList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, title: Text("My accounts")),
      body: accountList == null
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No account to show yet..."),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Text("Add account"),
                    onPressed: () => showAddAccountModal(context),
                  ),
                ),
              ],
            ))
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(accountList[index].name),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: accountList.length,
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showAddAccountModal(context),
        ),
      ),
    );
  }

  void showAddAccountModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) => AddAccountBottomSheet(
        onAccountSaved: () => loadAccountList(),
      ),
    );
  }

  void loadAccountList() {
    _preferencesManager.getAccountList().then((value) {
      setState(() => accountList = value);
    });
  }
}
