import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keykeeper/info_modal.dart';
import 'package:keykeeper/storage/account_model.dart';
import 'package:keykeeper/storage/preferences_manager.dart';

class AddAccountBottomSheet extends StatefulWidget {
  final Function onAccountSaved;

  const AddAccountBottomSheet({Key key, this.onAccountSaved}) : super(key: key);

  @override
  _AddAccountBottomSheetState createState() => _AddAccountBottomSheetState();
}

class _AddAccountBottomSheetState extends State<AddAccountBottomSheet> {
  bool _showSecond = false;
  AccountModel _accountModel = AccountModel();
  PreferencesManager _preferencesManager = PreferencesManager();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(16),
          child: AnimatedCrossFade(
              firstChild: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor, borderRadius: BorderRadius.circular(30)),
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height - 200),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ListTile(
                        title: Text("New Account"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Name", hintText: 'i.e. Gmail, Amazon, iCloud, Netflix...'),
                        onSaved: (value) => _accountModel.name = value.trim(),
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "User", hintText: 'john@example.com'),
                        onSaved: (value) => _accountModel.user = value.trim(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (value) => _accountModel.password = value.trim(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () => validateNewAccountSubmit(context),
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Text("Add account")],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              secondChild: InfoModal(
                title: "Great!",
                message: "A new account has been added to your list.",
                onCheckButtonPressed: () => Navigator.pop(context),
              ),
              crossFadeState: _showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 250)),
        );
      },
    );
  }

  Future validateNewAccountSubmit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _preferencesManager.saveAccount(_accountModel);
      widget.onAccountSaved.call();
      setState(() => _showSecond = true);
    }
  }
}
