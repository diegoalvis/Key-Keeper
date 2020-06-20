import 'package:flutter/material.dart';
import 'package:keykeeper/info_modal.dart';

class AddAccountBottomSheet extends StatefulWidget {
  @override
  _AddAccountBottomSheetState createState() => _AddAccountBottomSheetState();
}

class _AddAccountBottomSheetState extends State<AddAccountBottomSheet> {
  bool _showSecond = false;

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
                decoration: BoxDecoration(color: ThemeData.dark().dialogBackgroundColor, borderRadius: BorderRadius.circular(30)),
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height - 200),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.lock_outline),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Name", hintText: 'i.e. Gmail, Amazon, iCloud, Netflix...'),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
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

  void validateNewAccountSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      setState(() => _showSecond = true);
    } else {

    }
  }
}
