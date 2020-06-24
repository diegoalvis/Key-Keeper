import 'package:flutter/cupertino.dart';
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
      body: accountList == null || accountList.isEmpty
          ? buildEmptyStateWidget(context)
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ExpansionTile(
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert, size: 16),
                        onPressed: () => showDeleteAccountModal(context, index),
                      ),
                      children: <Widget>[
                        ListTile(leading: Icon(Icons.person_outline), title: Text(accountList[index].user)),
                        ListTile(leading: Icon(Icons.lock_outline), title: Text(accountList[index].password)),
                      ],
                      title: Text(accountList[index].name),
                      leading: Icon(Icons.picture_in_picture),
                    ),
                  );
                },
//              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16.0),
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

  Widget buildEmptyStateWidget(BuildContext context) {
    return Center(
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
    ));
  }

  void showDeleteAccountModal(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text('Delete Account'),
            content: Text('You will not longer able to restore the info...'),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  await _preferencesManager.removeAccount(index);
                  loadAccountList();
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Text("Delete anyway"),
              ),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Text("Cancel"),
              ),
            ],
          );
        });
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
